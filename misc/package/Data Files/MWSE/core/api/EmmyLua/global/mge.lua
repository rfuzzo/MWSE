
--- This function writes information to the mgeXE.log file in the user's installation directory. Wrapper for mwscript's MGELog function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/log.html).
---@type function
---@param message string
function mge.log(message) end

--- Selects a HUD element, to assume for future HUD calls.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/selectHUD.html).
---@type function
---@param hud string
function mge.selectHUD(hud) end

--- Disables a HUD element. If a HUD ID is provided, this is a warpper for MGEDisableHUD, otherwise it is a wrapper for MGENIDDisableHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/disableHUD.html).
---@type function
---@param hud string { optional = "after" }
function mge.disableHUD(hud) end

--- Gets the MGE version. Wrapper for MGEGetVersion.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getVersion.html).
---@type function
---@return number
function mge.getVersion() end

--- Disables a shader. Wrapper for mwscript's MGEDisableShader.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/disableShader.html).
---@type function
---@param shader string
function mge.disableShader(shader) end

--- Cancels selection for a HUD element. Wrapper for mwscript's MGECancelWithHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/unselectHUD.html).
---@type function
---@param hud string
function mge.unselectHUD(hud) end

--- Sets a shader's vector variable. Wrapper for mwscript's MGEShaderSetVector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setShaderVector4.html).
---@type function
---@param shader string
---@param variable string
---@param value table { comment = "A table of 4 values." }
function mge.setShaderVector4(shader, variable, value) end

--- Sets the effect long variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectLong.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setHUDEffectLong.html).
---@type function
---@param hud string { optional = "after" }
---@param variable string
---@param value number
function mge.setHUDEffectLong(hud, variable, value) end

--- Wrapper for MGESetCameraShakeMagnitude.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setCameraShakeMagnitude.html).
---@type function
---@param magnitude number
function mge.setCameraShakeMagnitude(magnitude) end

--- Wrapper for MGERotateScreenBy.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/modScreenRotation.html).
---@type function
---@param rotation number
function mge.modScreenRotation(rotation) end

--- Wrapper for MGERotateScreen.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setScreenRotation.html).
---@type function
---@param rotation number
function mge.setScreenRotation(rotation) end

--- Clears elements from the HUD. Wrapper for MGEWipeHUDElements.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/clearHUD.html).
---@type function
function mge.clearHUD() end

--- Enables MGE XE's screen spin effect. Wrapper for mwscript's MGEScreenSpin.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/startScreenRotation.html).
---@type function
function mge.startScreenRotation() end

--- Sets the effect for a HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDEffect, otherwise it is a wrapper for MGENIDChangeHUDEffect.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setHUDEffect.html).
---@type function
---@param hud string { optional = "after" }
---@param effect string
function mge.setHUDEffect(hud, effect) end

--- Frees a HUD element. If a HUD ID is provided, this is a warpper for MGEFreeHUD, otherwise it is a wrapper for MGENIDFreeHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/freeHUD.html).
---@type function
---@param hud string { optional = "after" }
function mge.freeHUD(hud) end

--- Enables a shader. Wrapper for mwscript's MGEEnableShader.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/enableShader.html).
---@type function
---@param shader string
function mge.enableShader(shader) end

--- Gets the window's vertical resolution. Wrapper for mwscript's MGEGetHeight.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getScreenHeight.html).
---@type function
---@return number
function mge.getScreenHeight() end

--- Wrapper for MGEGetScreenRotation.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getScreenRotation.html).
---@type function
---@return number
function mge.getScreenRotation() end

--- Wrapper for MGEGetZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getZoom.html).
---@type function
---@return number
function mge.getZoom() end

--- Positions a HUD element. If a HUD ID is provided, this is a warpper for MGEPositionHUD, otherwise it is a wrapper for MGENIDPositionHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/positionHUD.html).
---@type function
---@param hud string { optional = "after" }
---@param x number
---@param y number
function mge.positionHUD(hud, x, y) end

--- Returns the UI scaling used.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getUIScale.html).
---@type function
---@return number
function mge.getUIScale() end

--- Loads a HUD element. This is a warpper for MGELoadHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/loadHUD.html).
---@type function
---@param hud string
---@param texture string
---@param enable boolean { optional = "after" }
function mge.loadHUD(hud, texture, enable) end

--- Enables MGE XE's camera shake effect. Wrapper for mwscript's MGEEnableCameraShake.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/enableCameraShake.html).
---@type function
---@param magnitude number { optional = "after" }
---@param acceleration number { optional = "after" }
function mge.enableCameraShake(magnitude, acceleration) end

--- Enables the MGE XE zoom effect. Wrapper for MGEEnableZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/enableZoom.html).
---@type function
function mge.enableZoom() end

--- Sets the effect vector variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectVec.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setHUDEffectVector4.html).
---@type function
---@param hud string { optional = "after" }
---@param variable string
---@param value table { comment = "A table of 4 values." }
function mge.setHUDEffectVector4(hud, variable, value) end

--- Disables MGE XE's camera shake effect. Wrapper for mwscript's MGEDisableCameraShake.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/disableCameraShake.html).
---@type function
function mge.disableCameraShake() end

--- Wrapper for MGEZoom, or MGESetZoom if set to animate.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setZoom.html).
---@type function
---@param amount number
---@param animate boolean { optional = "after" }
function mge.setZoom(amount, animate) end

--- Wrapper for MGEStopZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/stopZoom.html).
---@type function
function mge.stopZoom() end

--- Scales a HUD element. If a HUD ID is provided, this is a warpper for MGEScaleHUD, otherwise it is a wrapper for MGENIDScaleHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/scaleHUD.html).
---@type function
---@param hud string { optional = "after" }
---@param x number
---@param y number
function mge.scaleHUD(hud, x, y) end

--- Toggles the MGE XE zoom effect. Wrapper for MGEToggleZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/toggleZoom.html).
---@type function
function mge.toggleZoom() end

--- Sets a shader's long variable. Wrapper for mwscript's MGEShaderSetLong.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setShaderLong.html).
---@type function
---@param shader string
---@param variable string
---@param value number
function mge.setShaderLong(shader, variable, value) end

--- Disables the MGE XE zoom effect. Wrapper for MGEDisableZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/disableZoom.html).
---@type function
function mge.disableZoom() end

--- Wrapper for MGEZoomOut, or MGEZoomOutBy if an amount is provided.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/zoomOut.html).
---@type function
---@param amount number { optional = "after" }
function mge.zoomOut(amount) end

--- Sets the effect float variable for a HUD element. This is a wrapper for MGENIDSetHUDEffectFloat.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setHUDEffectFloat.html).
---@type function
---@param hud string { optional = "after" }
---@param variable string
---@param value number
function mge.setHUDEffectFloat(hud, variable, value) end

--- Makes a HUD element fullscreen. If a HUD ID is provided, this is a warpper for MGEFullscreenHUD, otherwise it is a wrapper for MGENIDFullscreenHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/fullscreenHUD.html).
---@type function
---@param hud string { optional = "after" }
function mge.fullscreenHUD(hud) end

--- Disables MGE XE's screen spin effect. Wrapper for mwscript's MGEStopSpinSpin.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/stopScreenRotation.html).
---@type function
function mge.stopScreenRotation() end

--- Sets a shader's float variable. Wrapper for mwscript's MGEShaderSetFloat.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setShaderFloat.html).
---@type function
---@param shader string
---@param variable string
---@param value number
function mge.setShaderFloat(shader, variable, value) end

--- Wrapper for MGEZoomIn, or MGEZoomInBy if an amount is provided.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/zoomIn.html).
---@type function
---@param amount number { optional = "after" }
function mge.zoomIn(amount) end

--- Gets the window's horizontal resolution. Wrapper for mwscript's MGEGetWidth.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/getScreenWidth.html).
---@type function
---@return number
function mge.getScreenWidth() end

--- Enables a HUD element. If a HUD ID is provided, this is a warpper for MGEEnableHUD, otherwise it is a wrapper for MGENIDEnableHUD.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/enableHUD.html).
---@type function
---@param hud string { optional = "after" }
function mge.enableHUD(hud) end

--- Sets the texture for a given HUD element. If a HUD ID is provided, this is a warpper for MGEChangeHUDTexture, otherwise it is a wrapper for MGENIDChangeHUDTexture.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setHUDTexture.html).
---@type function
---@param hud string
---@param texture string
function mge.setHUDTexture(hud, texture) end

--- Wrapper for MGECameraShakeZoom.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mge/setCameraShakeAcceleration.html).
---@type function
---@param acceleration number
function mge.setCameraShakeAcceleration(acceleration) end


