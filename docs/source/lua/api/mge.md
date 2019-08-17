# mge

The mge library allows MGE XE mwscript functions to be called. This is not always ideal, and this library is deprecated.

## Functions

```eval_rst
.. toctree::
    :hidden:

    mge/clearHUD
    mge/disableCameraShake
    mge/disableHUD
    mge/disableShader
    mge/disableZoom
    mge/enableCameraShake
    mge/enableHUD
    mge/enableShader
    mge/enableZoom
    mge/freeHUD
    mge/fullscreenHUD
    mge/getScreenHeight
    mge/getScreenRotation
    mge/getScreenWidth
    mge/getUIScale
    mge/getVersion
    mge/getZoom
    mge/loadHUD
    mge/log
    mge/modScreenRotation
    mge/positionHUD
    mge/scaleHUD
    mge/selectHUD
    mge/setCameraShakeAcceleration
    mge/setCameraShakeMagnitude
    mge/setHUDEffect
    mge/setHUDEffectFloat
    mge/setHUDEffectLong
    mge/setHUDEffectVector4
    mge/setHUDTexture
    mge/setScreenRotation
    mge/setShaderFloat
    mge/setShaderLong
    mge/setShaderVector4
    mge/setZoom
    mge/startScreenRotation
    mge/stopScreenRotation
    mge/stopZoom
    mge/toggleZoom
    mge/unselectHUD
    mge/zoomIn
    mge/zoomOut
```

<dl class="describe">
<dt><code class="descname"><a href="mge/clearHUD.html">clearHUD</a>()</code></dt>
<dd>

Clears elements from the HUD. Wrapper for MGEWipeHUDElements.

</dd>
<dt><code class="descname"><a href="mge/disableCameraShake.html">disableCameraShake</a>()</code></dt>
<dd>

Disables MGE XE's camera shake effect. Wrapper for mwscript's MGEDisableCameraShake.

</dd>
<dt><code class="descname"><a href="mge/disableHUD.html">disableHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Disables a HUD element. If a HUD ID is provided, this is a warpper for MGEDisableHUD, otherwise it is a wrapper for MGENIDDisableHUD.

</dd>
<dt><code class="descname"><a href="mge/disableShader.html">disableShader</a>(<i>shader:</i> string)</code></dt>
<dd>

Disables a shader. Wrapper for mwscript's MGEDisableShader.

</dd>
<dt><code class="descname"><a href="mge/disableZoom.html">disableZoom</a>()</code></dt>
<dd>

Disables the MGE XE zoom effect. Wrapper for MGEDisableZoom.

</dd>
<dt><code class="descname"><a href="mge/enableCameraShake.html">enableCameraShake</a>(<i>magnitude:</i> number, <i>acceleration:</i> number)</code></dt>
<dd>

Enables MGE XE's camera shake effect. Wrapper for mwscript's MGEEnableCameraShake.

</dd>
<dt><code class="descname"><a href="mge/enableHUD.html">enableHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Enables a HUD element. If a HUD ID is provided, this is a warpper for MGEEnableHUD, otherwise it is a wrapper for MGENIDEnableHUD.

</dd>
<dt><code class="descname"><a href="mge/enableShader.html">enableShader</a>(<i>shader:</i> string)</code></dt>
<dd>

Enables a shader. Wrapper for mwscript's MGEEnableShader.

</dd>
<dt><code class="descname"><a href="mge/enableZoom.html">enableZoom</a>()</code></dt>
<dd>

Enables the MGE XE zoom effect. Wrapper for MGEEnableZoom.

</dd>
<dt><code class="descname"><a href="mge/freeHUD.html">freeHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Frees a HUD element. If a HUD ID is provided, this is a warpper for MGEFreeHUD, otherwise it is a wrapper for MGENIDFreeHUD.

</dd>
<dt><code class="descname"><a href="mge/fullscreenHUD.html">fullscreenHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Makes a HUD element fullscreen. If a HUD ID is provided, this is a warpper for MGEFullscreenHUD, otherwise it is a wrapper for MGENIDFullscreenHUD.

</dd>
<dt><code class="descname"><a href="mge/getScreenHeight.html">getScreenHeight</a>()</code></dt>
<dd>

Gets the window's vertical resolution. Wrapper for mwscript's MGEGetHeight.

</dd>
<dt><code class="descname"><a href="mge/getScreenRotation.html">getScreenRotation</a>()</code></dt>
<dd>

Wrapper for MGEGetScreenRotation.

</dd>
<dt><code class="descname"><a href="mge/getScreenWidth.html">getScreenWidth</a>()</code></dt>
<dd>

Gets the window's horizontal resolution. Wrapper for mwscript's MGEGetWidth.

</dd>
<dt><code class="descname"><a href="mge/getUIScale.html">getUIScale</a>()</code></dt>
<dd>

Returns the UI scaling used.

</dd>
<dt><code class="descname"><a href="mge/getVersion.html">getVersion</a>()</code></dt>
<dd>

Gets the MGE version. Wrapper for MGEGetVersion.

</dd>
<dt><code class="descname"><a href="mge/getZoom.html">getZoom</a>()</code></dt>
<dd>

Wrapper for MGEGetZoom.

</dd>
<dt><code class="descname"><a href="mge/loadHUD.html">loadHUD</a>(<i>hud:</i> string, <i>texture:</i> string, <i>enable:</i> boolean)</code></dt>
<dd>

Loads a HUD element. This is a warpper for MGELoadHUD.

</dd>
<dt><code class="descname"><a href="mge/log.html">log</a>(<i>message:</i> string)</code></dt>
<dd>

This function writes information to the mgeXE.log file in the user's installation directory. Wrapper for mwscript's MGELog function.

</dd>
<dt><code class="descname"><a href="mge/modScreenRotation.html">modScreenRotation</a>(<i>rotation:</i> number)</code></dt>
<dd>

Wrapper for MGERotateScreenBy.

</dd>
<dt><code class="descname"><a href="mge/positionHUD.html">positionHUD</a>(<i>hud:</i> string, <i>x:</i> number, <i>y:</i> number)</code></dt>
<dd>

Positions a HUD element. If a HUD ID is provided, this is a warpper for MGEPositionHUD, otherwise it is a wrapper for MGENIDPositionHUD.

</dd>
<dt><code class="descname"><a href="mge/scaleHUD.html">scaleHUD</a>(<i>hud:</i> string, <i>x:</i> number, <i>y:</i> number)</code></dt>
<dd>

Scales a HUD element. If a HUD ID is provided, this is a warpper for MGEScaleHUD, otherwise it is a wrapper for MGENIDScaleHUD.

</dd>
<dt><code class="descname"><a href="mge/selectHUD.html">selectHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Selects a HUD element, to assume for future HUD calls.

</dd>
<dt><code class="descname"><a href="mge/setCameraShakeAcceleration.html">setCameraShakeAcceleration</a>(<i>acceleration:</i> number)</code></dt>
<dd>

Wrapper for MGECameraShakeZoom.

</dd>
<dt><code class="descname"><a href="mge/setCameraShakeMagnitude.html">setCameraShakeMagnitude</a>(<i>magnitude:</i> number)</code></dt>
<dd>

Wrapper for MGESetCameraShakeMagnitude.

</dd>
<dt><code class="descname"><a href="mge/setHUDEffect.html">setHUDEffect</a>(<i>hud:</i> string, <i>effect:</i> string)</code></dt>
<dd>

Sets the effect for a HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDEffect, otherwise it is a wrapper for MGENIDChangeHUDEffect.

</dd>
<dt><code class="descname"><a href="mge/setHUDEffectFloat.html">setHUDEffectFloat</a>(<i>hud:</i> string, <i>variable:</i> string, <i>value:</i> number)</code></dt>
<dd>

Sets the effect float variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectFloat.

</dd>
<dt><code class="descname"><a href="mge/setHUDEffectLong.html">setHUDEffectLong</a>(<i>hud:</i> string, <i>variable:</i> string, <i>value:</i> number)</code></dt>
<dd>

Sets the effect long variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectLong.

</dd>
<dt><code class="descname"><a href="mge/setHUDEffectVector4.html">setHUDEffectVector4</a>(<i>hud:</i> string, <i>variable:</i> string, <i>value:</i> table)</code></dt>
<dd>

Sets the effect vector variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectVec.

</dd>
<dt><code class="descname"><a href="mge/setHUDTexture.html">setHUDTexture</a>(<i>hud:</i> string, <i>texture:</i> string)</code></dt>
<dd>

Sets the texture for a given HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDTexture, otherwise it is a wrapper for MGENIDChangeHUDTexture.

</dd>
<dt><code class="descname"><a href="mge/setScreenRotation.html">setScreenRotation</a>(<i>rotation:</i> number)</code></dt>
<dd>

Wrapper for MGERotateScreen.

</dd>
<dt><code class="descname"><a href="mge/setShaderFloat.html">setShaderFloat</a>(<i>shader:</i> string, <i>variable:</i> string, <i>value:</i> number)</code></dt>
<dd>

Sets a shader's float variable. Wrapper for mwscript's MGEShaderSetFloat.

</dd>
<dt><code class="descname"><a href="mge/setShaderLong.html">setShaderLong</a>(<i>shader:</i> string, <i>variable:</i> string, <i>value:</i> number)</code></dt>
<dd>

Sets a shader's long variable. Wrapper for mwscript's MGEShaderSetLong.

</dd>
<dt><code class="descname"><a href="mge/setShaderVector4.html">setShaderVector4</a>(<i>shader:</i> string, <i>variable:</i> string, <i>value:</i> table)</code></dt>
<dd>

Sets a shader's vector variable. Wrapper for mwscript's MGEShaderSetVector.

</dd>
<dt><code class="descname"><a href="mge/setZoom.html">setZoom</a>(<i>amount:</i> number, <i>animate:</i> boolean)</code></dt>
<dd>

Wrapper for MGEZoom, or MGESetZoom if set to animate.

</dd>
<dt><code class="descname"><a href="mge/startScreenRotation.html">startScreenRotation</a>()</code></dt>
<dd>

Enables MGE XE's screen spin effect. Wrapper for mwscript's MGEScreenSpin.

</dd>
<dt><code class="descname"><a href="mge/stopScreenRotation.html">stopScreenRotation</a>()</code></dt>
<dd>

Disables MGE XE's screen spin effect. Wrapper for mwscript's MGEStopSpinSpin.

</dd>
<dt><code class="descname"><a href="mge/stopZoom.html">stopZoom</a>()</code></dt>
<dd>

Wrapper for MGEStopZoom.

</dd>
<dt><code class="descname"><a href="mge/toggleZoom.html">toggleZoom</a>()</code></dt>
<dd>

Toggles the MGE XE zoom effect. Wrapper for MGEToggleZoom.

</dd>
<dt><code class="descname"><a href="mge/unselectHUD.html">unselectHUD</a>(<i>hud:</i> string)</code></dt>
<dd>

Cancels selection for a HUD element. Wrapper for mwscript's MGECancelWithHUD.

</dd>
<dt><code class="descname"><a href="mge/zoomIn.html">zoomIn</a>(<i>amount:</i> number)</code></dt>
<dd>

Wrapper for MGEZoomIn, or MGEZoomInBy if an amount is provided.

</dd>
<dt><code class="descname"><a href="mge/zoomOut.html">zoomOut</a>(<i>amount:</i> number)</code></dt>
<dd>

Wrapper for MGEZoomOut, or MGEZoomOutBy if an amount is provided.

</dd>
</dl>
