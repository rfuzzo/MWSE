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

#### [clearHUD](mge/clearHUD.md)

> Clears elements from the HUD. Wrapper for MGEWipeHUDElements.

#### [disableCameraShake](mge/disableCameraShake.md)

> Disables MGE XE's camera shake effect. Wrapper for mwscript's MGEDisableCameraShake.

#### [disableHUD](mge/disableHUD.md)

> Disables a HUD element. If a HUD ID is provided, this is a warpper for MGEDisableHUD, otherwise it is a wrapper for MGENIDDisableHUD.

#### [disableShader](mge/disableShader.md)

> Disables a shader. Wrapper for mwscript's MGEDisableShader.

#### [disableZoom](mge/disableZoom.md)

> Disables the MGE XE zoom effect. Wrapper for MGEDisableZoom.

#### [enableCameraShake](mge/enableCameraShake.md)

> Enables MGE XE's camera shake effect. Wrapper for mwscript's MGEEnableCameraShake.

#### [enableHUD](mge/enableHUD.md)

> Enables a HUD element. If a HUD ID is provided, this is a warpper for MGEEnableHUD, otherwise it is a wrapper for MGENIDEnableHUD.

#### [enableShader](mge/enableShader.md)

> Enables a shader. Wrapper for mwscript's MGEEnableShader.

#### [enableZoom](mge/enableZoom.md)

> Enables the MGE XE zoom effect. Wrapper for MGEEnableZoom.

#### [freeHUD](mge/freeHUD.md)

> Frees a HUD element. If a HUD ID is provided, this is a warpper for MGEFreeHUD, otherwise it is a wrapper for MGENIDFreeHUD.

#### [fullscreenHUD](mge/fullscreenHUD.md)

> Makes a HUD element fullscreen. If a HUD ID is provided, this is a warpper for MGEFullscreenHUD, otherwise it is a wrapper for MGENIDFullscreenHUD.

#### [getScreenHeight](mge/getScreenHeight.md)

> Gets the window's vertical resolution. Wrapper for mwscript's MGEGetHeight.

#### [getScreenRotation](mge/getScreenRotation.md)

> Wrapper for MGEGetScreenRotation.

#### [getScreenWidth](mge/getScreenWidth.md)

> Gets the window's horizontal resolution. Wrapper for mwscript's MGEGetWidth.

#### [getUIScale](mge/getUIScale.md)

> Returns the UI scaling used.

#### [getVersion](mge/getVersion.md)

> Gets the MGE version. Wrapper for MGEGetVersion.

#### [getZoom](mge/getZoom.md)

> Wrapper for MGEGetZoom.

#### [loadHUD](mge/loadHUD.md)

> Loads a HUD element. This is a warpper for MGELoadHUD.

#### [log](mge/log.md)

> This function writes information to the mgeXE.log file in the user's installation directory. Wrapper for mwscript's MGELog function.

#### [modScreenRotation](mge/modScreenRotation.md)

> Wrapper for MGERotateScreenBy.

#### [positionHUD](mge/positionHUD.md)

> Positions a HUD element. If a HUD ID is provided, this is a warpper for MGEPositionHUD, otherwise it is a wrapper for MGENIDPositionHUD.

#### [scaleHUD](mge/scaleHUD.md)

> Scales a HUD element. If a HUD ID is provided, this is a warpper for MGEScaleHUD, otherwise it is a wrapper for MGENIDScaleHUD.

#### [selectHUD](mge/selectHUD.md)

> Selects a HUD element, to assume for future HUD calls.

#### [setCameraShakeAcceleration](mge/setCameraShakeAcceleration.md)

> Wrapper for MGECameraShakeZoom.

#### [setCameraShakeMagnitude](mge/setCameraShakeMagnitude.md)

> Wrapper for MGESetCameraShakeMagnitude.

#### [setHUDEffect](mge/setHUDEffect.md)

> Sets the effect for a HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDEffect, otherwise it is a wrapper for MGENIDChangeHUDEffect.

#### [setHUDEffectFloat](mge/setHUDEffectFloat.md)

> Sets the effect float variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectFloat.

#### [setHUDEffectLong](mge/setHUDEffectLong.md)

> Sets the effect long variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectLong.

#### [setHUDEffectVector4](mge/setHUDEffectVector4.md)

> Sets the effect vector variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectVec.

#### [setHUDTexture](mge/setHUDTexture.md)

> Sets the texture for a given HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDTexture, otherwise it is a wrapper for MGENIDChangeHUDTexture.

#### [setScreenRotation](mge/setScreenRotation.md)

> Wrapper for MGERotateScreen.

#### [setShaderFloat](mge/setShaderFloat.md)

> Sets a shader's float variable. Wrapper for mwscript's MGEShaderSetFloat.

#### [setShaderLong](mge/setShaderLong.md)

> Sets a shader's long variable. Wrapper for mwscript's MGEShaderSetLong.

#### [setShaderVector4](mge/setShaderVector4.md)

> Sets a shader's vector variable. Wrapper for mwscript's MGEShaderSetVector.

#### [setZoom](mge/setZoom.md)

> Wrapper for MGEZoom, or MGESetZoom if set to animate.

#### [startScreenRotation](mge/startScreenRotation.md)

> Enables MGE XE's screen spin effect. Wrapper for mwscript's MGEScreenSpin.

#### [stopScreenRotation](mge/stopScreenRotation.md)

> Disables MGE XE's screen spin effect. Wrapper for mwscript's MGEStopSpinSpin.

#### [stopZoom](mge/stopZoom.md)

> Wrapper for MGEStopZoom.

#### [toggleZoom](mge/toggleZoom.md)

> Toggles the MGE XE zoom effect. Wrapper for MGEToggleZoom.

#### [unselectHUD](mge/unselectHUD.md)

> Cancels selection for a HUD element. Wrapper for mwscript's MGECancelWithHUD.

#### [zoomIn](mge/zoomIn.md)

> Wrapper for MGEZoomIn, or MGEZoomInBy if an amount is provided.

#### [zoomOut](mge/zoomOut.md)

> Wrapper for MGEZoomOut, or MGEZoomOutBy if an amount is provided.
