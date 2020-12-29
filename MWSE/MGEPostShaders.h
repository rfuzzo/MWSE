#pragma once

#include "MGEDoubleSurface.h"

namespace mge {
	enum EffectVariableID {
		EV_lastshader, EV_lastpass, EV_depthframe, EV_watertexture,
		EV_eyevec, EV_eyepos, EV_sunvec, EV_suncol, EV_sunamb, EV_sunpos, EV_sunvis, EV_HDR,
		EV_mview, EV_mproj, EV_fogcol, EV_fogstart, EV_fogrange, EV_fognearstart, EV_fognearrange,
		EV_rcpres, EV_fov, EV_time, EV_waterlevel, EV_isinterior, EV_isunderwater,
		EV_COUNT
	};

	class ShaderHandle {
	public:
		ShaderHandle(std::string name);
		~ShaderHandle();

		// Reloads the shader from the source file. Returns false if it failed.
		void reload();

		// Releases all shader resources. Does not reload variables.
		void release();

		//
		// Basic utility functions.
		//

		inline auto& getName() const { return m_Name; }
		inline auto getEffect() const { return m_Effect; }
		inline auto getEnabled() const { return m_Enabled; }
		bool setEnabled(bool value);
		inline auto getTimestamp() const { return m_Timestamp; }
		inline auto getLegacyFlags() const { return m_LegacyMGEFlags; }

		//
		// Convenient access for legacy MGE XE shader variables.
		//

		bool setLegacyTexture(EffectVariableID id, LPDIRECT3DBASETEXTURE9 value) const;
		bool setLegacyTexture(const char* name, LPDIRECT3DBASETEXTURE9 value) const;
		bool setLegacyMatrix(EffectVariableID id, const D3DXMATRIX* value) const;
		bool setLegacyMatrix(const char* name, const D3DXMATRIX* value) const;
		bool setLegacyFloatArray(EffectVariableID id, const float* values, int count) const;
		bool setLegacyFloatArray(const char* name, const float* values, int count) const;
		bool setLegacyFloat(EffectVariableID id, float value) const;
		bool setLegacyFloat(const char* name, float value) const;
		bool setLegacyInt(EffectVariableID id, int value) const;
		bool setLegacyInt(const char* name, int value) const;
		bool setLegacyBool(EffectVariableID id, bool value) const;
		bool setLegacyBool(const char* name, bool value) const;

		//
		// Convenience functions for lua.
		//

		std::string toJson() const;

		D3DXHANDLE getVariableHandle(const char* name) const;

		sol::object getVariable(const char* name, sol::this_state ts) const;
		void setVariable(const char* name, sol::stack_object value);

	private:

		bool checkVersion() const;

		// Sets variable handles and loads source textures.
		void initialize();

		std::string m_Name;
		ID3DXEffect* m_Effect;
		bool m_Enabled;
		DWORD m_Timestamp;
		int m_LegacyMGEFlags;
		D3DXHANDLE m_LegacyVariableHandles[EV_COUNT];

		std::unordered_map<std::string, D3DXHANDLE> m_VariableHandles;
		std::unordered_map<D3DXHANDLE, D3DXPARAMETER_TYPE> m_VariableTypes;

	};

	class PostShaders {
		static IDirect3DDevice9* device;
		static std::vector<std::shared_ptr<ShaderHandle>> shaders;
		static std::vector<D3DXMACRO> features;
		static IDirect3DTexture9* texLastShader;
		static IDirect3DSurface9* surfaceLastShader;
		static SurfaceDoubleBuffer doublebuffer;
		static IDirect3DVertexBuffer9* vbPost;
		static IDirect3DSurface9* surfReadqueue, * surfReadback;
		static D3DXVECTOR4 adaptPoint;
		static float rcpRes[2];

	public:
		static bool init(IDirect3DDevice9* realDevice);
		static bool initShaderChain();
		static void setShaderConstants(ShaderHandle* shader);
		static bool updateShaderChain();
		static bool initBuffers();
		static void release();

		static std::shared_ptr<ShaderHandle> findShader(const char* shaderName);
		static bool setShaderVar(const char* shaderName, const char* varName, int x);
		static bool setShaderVar(const char* shaderName, const char* varName, float x);
		static bool setShaderVar(const char* shaderName, const char* varName, float* v);
		static bool setShaderEnable(const char* shaderName, bool enable);

		static void evalAdaptHDR(IDirect3DSurface9* source, int environmentFlags, float dt);
		static void shaderTime(int environmentFlags, float frameTime);
		static IDirect3DTexture9* borrowBuffer(int n);
		static void applyBlend();

		static inline auto getDevice() { return device; }
		static inline auto& getShaders() { return shaders; }
		static inline CONST D3DXMACRO* getFeatures() { return &*features.begin(); }
	};
}
