
#include "d3d8header.h"
#include "Log.h"
#include "MGEConfiguration.h"
#include "MGEMWBridge.h"
#include "MGEPostShaders.h"
#include "MGEDistantLand.h"

namespace mge {
	// Must match enum EffectVariableID in postshaders.h
	const char* effectVariableList[] = {
		"lastshader", "lastpass", "depthframe", "watertexture",
		"eyevec", "eyepos", "sunvec", "suncol", "sunamb", "sunpos", "sunvis", "HDR",
		"mview", "mproj", "fogcol", "fogstart", "fogrange", "fognearstart", "fognearrange",
		"rcpres", "fov", "time", "waterlevel", "isInterior", "isUnderwater"
	};

	const int effectVariableCount = sizeof(effectVariableList) / sizeof(const char*);
	const char* compatibleShader = "MGE XE 0";

	const DWORD fvfPost = D3DFVF_XYZRHW | D3DFVF_TEX2;  // XYZRHW -> skips vertex shader
	const DWORD fvfBlend = D3DFVF_XYZW | D3DFVF_TEX2;

	IDirect3DDevice9* PostShaders::device;
	std::vector<std::shared_ptr<ShaderHandle>> PostShaders::shaders;
	std::vector<D3DXMACRO> PostShaders::features;
	IDirect3DTexture9* PostShaders::texLastShader;
	IDirect3DSurface9* PostShaders::surfaceLastShader;
	SurfaceDoubleBuffer PostShaders::doublebuffer;
	IDirect3DVertexBuffer9* PostShaders::vbPost;
	IDirect3DSurface9* PostShaders::surfReadqueue, * PostShaders::surfReadback;
	D3DXVECTOR4 PostShaders::adaptPoint;
	float PostShaders::rcpRes[2];



	// init - Initialize post-processing shader system
	bool PostShaders::init(IDirect3DDevice9* realDevice) {
		device = realDevice;

		if (!initBuffers()) {
			return false;
		}

		if (!initShaderChain()) {
			return false;
		}

		return true;
	}

	static const D3DXMACRO macroExpFog = { "USE_EXPFOG", "" };
	static const D3DXMACRO macroTerminator = { 0, 0 };

	// initShaderChain - Load and prepare all shaders, ignoring invalid shaders
	bool PostShaders::initShaderChain() {
		char path[MAX_PATH];

		// Set shader defines corresponding to required features
		if (Configuration.MGEFlags & EXP_FOG) {
			features.push_back(macroExpFog);
		}
		features.push_back(macroTerminator);

		// Create each shader.
		for (const char* p = Configuration.ShaderChain; *p; p += strlen(p) + 1) {
			try {
				shaders.push_back(std::make_shared<ShaderHandle>(p));
			}
			catch (std::exception& e) {
				mwse::log::getLog() << "Failed to create shader: " << e.what();
			}
		}


		if (Configuration.MGEFlags & NO_MW_SUNGLARE) {
			MWBridge::get()->disableSunglare();
		}

		return true;
	}

	void PostShaders::setShaderConstants(ShaderHandle* shader) {
		shader->setLegacyFloatArray(EV_rcpres, rcpRes, 2);
	}

	// updateShaderChain
	// Reloads shaders that have changed
	bool PostShaders::updateShaderChain() {
		char path[MAX_PATH];
		bool updated = false;

		for (auto& s : shaders) {
			WIN32_FILE_ATTRIBUTE_DATA fileAttrs;
			ID3DXEffect* effect;
			ID3DXBuffer* errors;

			std::snprintf(path, sizeof(path), "Data Files\\shaders\\XEshaders\\%s.fx", s->getName().c_str());
			if (!GetFileAttributesEx(path, GetFileExInfoStandard, &fileAttrs)) {
				continue;
			}

			if (s->getTimestamp() != fileAttrs.ftLastWriteTime.dwLowDateTime) {
				try {
					if (s->reload()) {
						updated = true;
					}
				}
				catch (std::exception& e) {
					mwse::log::getLog() << "Failed to update shader: " << e.what();
				}
			}
		}

		return updated;
	}

	// initBuffers - Create ping-pong buffers and HDR resolve surfaces
	bool PostShaders::initBuffers() {
		// Check view dimensions
		D3DVIEWPORT9 vp;
		device->GetViewport(&vp);

		// Shaders need to know rcpres
		rcpRes[0] = 1.0f / vp.Width;
		rcpRes[1] = 1.0f / vp.Height;

		// Set up texture buffers
		IDirect3DTexture9* texDoubleBuffer[2];
		UINT w = vp.Width, h = vp.Height;
		HRESULT hr;

		hr = device->CreateTexture(w, h, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &texLastShader, NULL);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create post-process render target");
			return false;
		}
		hr = device->CreateTexture(w, h, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &texDoubleBuffer[0], NULL);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create post-process render target");
			return false;
		}
		hr = device->CreateTexture(w, h, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &texDoubleBuffer[1], NULL);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create post-process render target");
			return false;
		}

		// Buffering setup
		IDirect3DSurface9* surfaceDoubleBuffer[2];

		texLastShader->GetSurfaceLevel(0, &surfaceLastShader);
		texDoubleBuffer[0]->GetSurfaceLevel(0, &surfaceDoubleBuffer[0]);
		texDoubleBuffer[1]->GetSurfaceLevel(0, &surfaceDoubleBuffer[1]);
		doublebuffer.init(texDoubleBuffer, surfaceDoubleBuffer);

		// Skip vertex shader with post-transform vertex buffer
		hr = device->CreateVertexBuffer(4 * 32, 0, 0, D3DPOOL_MANAGED, &vbPost, 0);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create post-process verts");
			return false;
		}

		// Format: Post-transform position, texture xy, normalized device xy
		D3DXVECTOR4* v;
		vbPost->Lock(0, 0, (void**)&v, 0);
		v[0] = D3DXVECTOR4(-0.5f, h - 0.5f, 0.0f, 1.0f);
		v[1] = D3DXVECTOR4(0, 1, -1, -1);
		v[2] = D3DXVECTOR4(-0.5f, -0.5f, 0.0f, 1.0f);
		v[3] = D3DXVECTOR4(0, 0, -1, 1);
		v[4] = D3DXVECTOR4(w - 0.5f, h - 0.5f, 0.0f, 1.0f);
		v[5] = D3DXVECTOR4(1, 1, 1, -1);
		v[6] = D3DXVECTOR4(w - 0.5f, -0.5f, 0.0f, 1.0f);
		v[7] = D3DXVECTOR4(1, 0, 1, 1);
		vbPost->Unlock();

		// HDR readback system
		hr = device->CreateRenderTarget(1, 1, D3DFMT_A8R8G8B8, D3DMULTISAMPLE_NONE, 0, false, &surfReadqueue, NULL);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create HDR surface queue");
			return false;
		}
		hr = device->CreateOffscreenPlainSurface(1, 1, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, &surfReadback, NULL);
		if (hr != D3D_OK) {
			mwse::log::logLine("!! Failed to create HDR surface queue");
			return false;
		}
		adaptPoint = D3DXVECTOR4(1.0, 1.0, 1.0, 1.0);

		return true;
	}

	// release - Cleans up Direct3D resources
	void PostShaders::release() {
		for (auto& s : shaders) {
			s->release();
		}
		shaders.clear();

		surfaceLastShader->Release();
		texLastShader->Release();
		doublebuffer.sourceSurface()->Release();
		doublebuffer.sourceTexture()->Release();
		doublebuffer.sinkSurface()->Release();
		doublebuffer.sinkTexture()->Release();
		vbPost->Release();
		surfReadqueue->Release();
		surfReadback->Release();
	}

	// evalAdaptHDR - Downsample and readback a frame to get an averaged luminance for HDR
	void PostShaders::evalAdaptHDR(IDirect3DSurface9* source, int environmentFlags, float dt) {
		D3DLOCKED_RECT lock;
		RECT rectSrc = { 0, 0, 0, 0 };
		RECT rectDownsample = { 0, 0, 0, 0 };
		float r, g, b;

		// Read resolved data from last frame
		surfReadback->LockRect(&lock, NULL, D3DLOCK_READONLY);
		BYTE* data = (BYTE*)lock.pBits;
		r = data[0] / 255.0f;
		g = data[1] / 255.0f;
		b = data[2] / 255.0f;
		surfReadback->UnlockRect();

		// Convert to environment-weighted luminance and average over time
		// x = normalized weighted lumi, y = unweighted lumi, z = unnormalized weighted lumi, w = immediate unweighted lumi
		float environmentScaling = (environmentFlags & 6) ? 2.5f : 1.0f;
		float lambda = exp(-dt / Configuration.HDRReactionSpeed);
		adaptPoint.w = 0.27f * r + 0.67f * g + 0.06f * b;
		adaptPoint.z = adaptPoint.w * environmentScaling + (adaptPoint.z - adaptPoint.w * environmentScaling) * lambda;
		adaptPoint.y = adaptPoint.w + (adaptPoint.y - adaptPoint.w) * lambda;
		adaptPoint.x = adaptPoint.z / environmentScaling;

		// Shrink this frame down to a 1x1 texture
		rectDownsample.right = 512;
		rectDownsample.bottom = 512;
		device->StretchRect(source, 0, doublebuffer.sinkSurface(), &rectDownsample, D3DTEXF_LINEAR);
		doublebuffer.cycle();

		while (rectDownsample.right > 1 || rectDownsample.bottom > 1) {
			rectSrc = rectDownsample;
			rectDownsample.right = std::max(1L, rectSrc.right >> 1);
			rectDownsample.bottom = std::max(1L, rectSrc.bottom >> 1);
			device->StretchRect(doublebuffer.sourceSurface(), &rectSrc, doublebuffer.sinkSurface(), &rectDownsample, D3DTEXF_LINEAR);
			doublebuffer.cycle();
		}

		// Copy and queue readback
		device->StretchRect(doublebuffer.sourceSurface(), &rectDownsample, surfReadqueue, 0, D3DTEXF_NONE);
		device->GetRenderTargetData(surfReadqueue, surfReadback);
	}

	// shaderTime - Applies all post processing shaders for the current frame
	void PostShaders::shaderTime(int environmentFlags, float frameTime) {
		IDirect3DSurface9* backbuffer, * depthstencil;

		// Turn off depth stencil use
		device->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &backbuffer);
		device->GetDepthStencilSurface(&depthstencil);
		device->SetDepthStencilSurface(NULL);

		// Turn off useless states
		device->SetRenderState(D3DRS_ZENABLE, 0);
		device->SetRenderState(D3DRS_ZWRITEENABLE, 0);
		device->SetRenderState(D3DRS_ALPHABLENDENABLE, 0);
		device->SetRenderState(D3DRS_ALPHATESTENABLE, 0);

		// Make sure fogging is off, drivers are not consistent in applying fog to post-transform vertices
		device->SetRenderState(D3DRS_FOGENABLE, 0);

		// Bypass texgen and texture matrix for compatibility with WINE
		// Normally texgen does not run on post-transform vertices, but WINE incorrectly does this
		D3DXMATRIX ident;
		D3DXMatrixIdentity(&ident);
		device->SetTextureStageState(0, D3DTSS_TEXCOORDINDEX, 0);
		device->SetTextureStageState(1, D3DTSS_TEXCOORDINDEX, 1);
		device->SetTransform(D3DTS_TEXTURE0, &ident);
		device->SetTransform(D3DTS_TEXTURE1, &ident);

		// Resolve back buffer to lastshader surface
		device->StretchRect(backbuffer, 0, surfaceLastShader, 0, D3DTEXF_NONE);

		// Set vertex buffer
		device->SetFVF(fvfPost);
		device->SetStreamSource(0, vbPost, 0, 32);
		device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);

		// Evaluate HDR if required
		if (Configuration.MGEFlags & USE_HDR) {
			evalAdaptHDR(surfaceLastShader, environmentFlags, frameTime);
		}

		// Render all those shaders
		for (auto& s : shaders) {
			ID3DXEffect* effect = s->getEffect();
			UINT passes;

			if (!s->getEnabled()) {
				continue;
			}
			if (s->getLegacyFlags() & environmentFlags) {
				continue;
			}

			DistantLand::updatePostShader(s.get());
			s->setLegacyFloatArray(EV_HDR, adaptPoint, 4);
			s->setLegacyTexture(EV_lastshader, texLastShader);

			effect->Begin(&passes, 0);
			for (UINT p = 0; p != passes; ++p) {
				device->SetRenderTarget(0, doublebuffer.sinkSurface());
				s->setLegacyTexture(EV_lastpass, doublebuffer.sourceTexture());

				effect->BeginPass(p);
				device->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
				effect->EndPass();

				doublebuffer.cycle();
			}
			effect->End();

			// Avoid another copy by exchanging which surfaces are buffers
			doublebuffer.exchangeSource(&texLastShader, &surfaceLastShader);
		}

		// Copy result to back buffer
		device->StretchRect(surfaceLastShader, 0, backbuffer, 0, D3DTEXF_NONE);

		// Restore render target
		device->SetRenderTarget(0, backbuffer);
		device->SetDepthStencilSurface(depthstencil);
		backbuffer->Release();

		if (depthstencil) {
			depthstencil->Release();
		}
	}

	// borrowBuffer - Utility function for distant land to temporarily use a ping-pong buffer
	IDirect3DTexture9* PostShaders::borrowBuffer(int n) {
		IDirect3DSurface9* backbuffer;

		// Make a backbuffer copy for temporary use
		doublebuffer.select(n);
		device->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &backbuffer);
		device->StretchRect(backbuffer, 0, doublebuffer.sourceSurface(), 0, D3DTEXF_NONE);
		backbuffer->Release();

		return doublebuffer.sourceTexture();
	}

	// applyBlend - Utility function for distant land to render a full-screen shader
	void PostShaders::applyBlend() {
		// Render with vertex shader by using a different FVF for the same buffer
		device->SetFVF(fvfBlend);
		device->SetStreamSource(0, vbPost, 0, 32);
		device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
		device->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
	}



	// Scripting interface for shaders
	ShaderHandle* PostShaders::findShader(const char* shaderName) {
		for (auto& s : shaders) {
			if (s->getName() == shaderName) {
				return s.get();
			}
		}
		return nullptr;
	}

	bool PostShaders::setShaderVar(const char* shaderName, const char* varName, int x) {
		ShaderHandle* shader = findShader(shaderName);
		if (!shader) {
			return false;
		}

		return shader->setLegacyInt(varName, x);
	}

	bool PostShaders::setShaderVar(const char* shaderName, const char* varName, float x) {
		ShaderHandle* shader = findShader(shaderName);
		if (!shader) {
			return false;
		}

		return shader->setLegacyFloat(varName, x);
	}

	bool PostShaders::setShaderVar(const char* shaderName, const char* varName, float* v) {
		ShaderHandle* shader = findShader(shaderName);
		if (!shader) {
			return false;
		}

		return shader->setLegacyFloatArray(varName, v, 4);
	}

	bool PostShaders::setShaderEnable(const char* shaderName, bool enable) {
		ShaderHandle* shader = findShader(shaderName);
		if (!shader) {
			return false;
		}

		return shader->setEnabled(enable);
	}

	//
	// Shader handlers.
	//

	ShaderHandle::ShaderHandle(std::string name) :
		m_Name(std::move(name)),
		m_Effect(nullptr),
		m_Enabled(false),
		m_Timestamp(0),
		m_LegacyMGEFlags(0)
	{
		// Define variables we can't define above.
		memset(m_LegacyVariableHandles, 0, sizeof(m_LegacyVariableHandles));

		if (!reload()) {
			throw std::runtime_error("Could not load shader. It may not meet version requirements.");
		}
	}

	ShaderHandle::~ShaderHandle() {
		release();
	}

	bool ShaderHandle::reload() {
		// Temporarily disable shader.
		auto wasEnabled = m_Enabled;
		release();

		char path[MAX_PATH];
		WIN32_FILE_ATTRIBUTE_DATA fileAttrs;
		std::snprintf(path, sizeof(path), "Data Files\\shaders\\XEshaders\\%s.fx", m_Name.c_str());
		if (!GetFileAttributesEx(path, GetFileExInfoStandard, &fileAttrs)) {
			throw std::runtime_error("Post shader missing.");
		}

		ID3DXBuffer* errors;
		if (D3DXCreateEffectFromFile(PostShaders::getDevice(), path, PostShaders::getFeatures(), 0, D3DXFX_LARGEADDRESSAWARE, 0, &m_Effect, &errors) != D3D_OK) {
			std::ostringstream ss;
			ss << "Post shader " << path << " failed to load/compile.";
			if (errors) {
				ss << "Errors: " << reinterpret_cast<const char*>(errors->GetBufferPointer());
			}
			ss << std::endl;
			throw std::runtime_error(std::move(ss.str()));
		}

		if (!checkVersion()) {
			throw std::runtime_error("Shader does not meet version requirements.");
		}

		// Update variables.
		initialize();
		m_Timestamp = fileAttrs.ftLastWriteTime.dwLowDateTime;

		// Restore enabled state.
		m_Enabled = wasEnabled;
	}

	void ShaderHandle::release() {
		// Release effect.
		if (m_Effect) {
			m_Effect->Release();
			m_Effect = nullptr;
		}

		// Clear legacy variable handles.
		memset(m_LegacyVariableHandles, 0, sizeof(m_LegacyVariableHandles));

		// Flag as disabled.
		m_Enabled = false;
	}

	bool ShaderHandle::setEnabled(bool value) {
		if (m_Effect) {
			m_Enabled = value;
			return true;
		}
		return false;
	}

	bool ShaderHandle::setLegacyTexture(EffectVariableID id, LPDIRECT3DBASETEXTURE9 value) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetTexture(m_LegacyVariableHandles[id], value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyTexture(const char* name, LPDIRECT3DBASETEXTURE9 value) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetTexture(handle, value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyMatrix(EffectVariableID id, const D3DXMATRIX* value) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetMatrix(m_LegacyVariableHandles[id], value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyMatrix(const char* name, const D3DXMATRIX* value) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetMatrix(handle, value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyFloatArray(EffectVariableID id, const float* values, int count) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetFloatArray(m_LegacyVariableHandles[id], values, count) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyFloatArray(const char* name, const float* values, int count) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetFloatArray(handle, values, count) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyFloat(EffectVariableID id, float value) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetFloat(m_LegacyVariableHandles[id], value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyFloat(const char* name, float value) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetFloat(handle, value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyInt(EffectVariableID id, int value) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetInt(m_LegacyVariableHandles[id], value);
		}
		return false;
	}

	bool ShaderHandle::setLegacyInt(const char* name, int value) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetInt(handle, value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyBool(EffectVariableID id, bool value) const {
		assert(id < EV_COUNT);
		if (m_LegacyVariableHandles[id]) {
			return m_Effect->SetBool(m_LegacyVariableHandles[id], value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::setLegacyBool(const char* name, bool value) const {
		auto handle = m_Effect->GetParameterByName(0, name);
		if (handle) {
			return m_Effect->SetBool(handle, value) == D3D_OK;
		}
		return false;
	}

	bool ShaderHandle::checkVersion() const {
		auto tech = m_Effect->GetTechnique(0);
		if (tech == 0) {
			return false;
		}

		auto ver = m_Effect->GetAnnotationByName(tech, "MGEinterface");
		if (ver == 0) {
			return false;
		}

		const char* verstr;
		if (m_Effect->GetString(ver, &verstr) == D3D_OK) {
			if (std::strcmp(verstr, compatibleShader) == 0) {
				return true;
			}
		}

		return false;
	}

	void ShaderHandle::initialize() {
		// Fill out handles for legacy variables.
		for (size_t i = 0u; i != effectVariableCount; ++i) {
			m_LegacyVariableHandles[i] = m_Effect->GetParameterByName(0, effectVariableList[i]);
		}

		// Read environment activation flags
		D3DXHANDLE ehMGEflags = m_Effect->GetParameterByName(0, "mgeflags");
		if (ehMGEflags) {
			m_Effect->GetInt(ehMGEflags, &m_LegacyMGEFlags);
		}

		// Set HDR and sunglare configuration flags if the shader requires it.
		auto technique = m_Effect->GetTechnique(0);
		if (m_Effect->GetAnnotationByName(technique, "requiresHDR")) {
			Configuration.MGEFlags |= USE_HDR;
		}
		if (m_Effect->GetAnnotationByName(technique, "disableSunglare")) {
			Configuration.MGEFlags |= NO_MW_SUNGLARE;
		}

		// Load source textures.
		char fullSourceTexturePath[MAX_PATH];
		for (size_t i = 0; true; i++) {
			D3DXHANDLE ehTextureRef = m_Effect->GetParameter(0, i);
			if (ehTextureRef == 0) {
				break;
			}

			D3DXHANDLE ehTextureSrc = m_Effect->GetAnnotationByName(ehTextureRef, "src");
			if (ehTextureSrc == 0) {
				continue;
			}

			const char* sourceTexturePath;
			if (m_Effect->GetString(ehTextureSrc, &sourceTexturePath) != D3D_OK) {
				continue;
			}

			IDirect3DTexture9* tex;
			std::snprintf(fullSourceTexturePath, sizeof(fullSourceTexturePath), "Data Files\\textures\\%s", sourceTexturePath);
			if (D3DXCreateTextureFromFile(PostShaders::getDevice(), fullSourceTexturePath, &tex) != D3D_OK) {
				std::ostringstream ss;
				ss << "Failed to load texture '" << fullSourceTexturePath << "'.";
				throw std::runtime_error(std::move(ss.str()));
			}
			m_Effect->SetTexture(ehTextureRef, tex);
		}

		// Give the controller an opportunity to set constants.
		PostShaders::setShaderConstants(this);
	}
}
