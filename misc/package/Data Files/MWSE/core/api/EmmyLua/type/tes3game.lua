
--- A core game object used for storing game settings.
---@class tes3game
tes3game = {}

--- Sound quality level.
---@type number
tes3game.soundQuality = nil

--- The screen's horizontal position.
---@type number
tes3game.screenX = nil

--- Mix volumes for music.
---@type number
tes3game.volumeMedia = nil

--- The screen's vertical position.
---@type number
tes3game.screenY = nil

--- The game's rendering distance.
---@type number
tes3game.renderDistance = nil

--- The Windows HWND for the parent window.
---@type number
tes3game.parentWindowHandle = nil

--- Access to the root of the scene graph.
---@type niNode
tes3game.worldSceneGraphRoot = nil

--- State on if screenshots are enabled.
---@type boolean
tes3game.screenShotsEnabled = nil

--- The current activation target.
---@type tes3reference
tes3game.playerTarget = nil

--- Mix volumes for voices.
---@type number
tes3game.voice = nil

--- Mix volumes for effects.
---@type number
tes3game.volumeEffect = nil

--- Mix volumes for all sounds.
---@type number
tes3game.volumeMaster = nil

--- The Windows HWND for the window.
---@type number
tes3game.windowHandle = nil

--- Mix volumes for footsteps.
---@type number
tes3game.volumeFootsteps = nil

--- The reused wireframe property, appled when toggling wireframe rendering.
---@type niProperty
tes3game.wireframeProperty = nil


