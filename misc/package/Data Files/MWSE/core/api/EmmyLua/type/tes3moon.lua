
--- A structure that keeps track of information related two the game's two moons.
---@class tes3moon
tes3moon = {}

---@type number
tes3moon.fadeOutStart = nil

---@type number
tes3moon.axisOffset = nil

--- The index of the moon, 0 for Masser, 1 for Secunda
---@type number
tes3moon.index = nil

---@type number
tes3moon.phase = nil

---@type number
tes3moon.fadeInFinish = nil

---@type number
tes3moon.dailyIncrement = nil

---@type number
tes3moon.fadeInStart = nil

---@type number
tes3moon.shadowEarlyFadeAngle = nil

---@type number
tes3moon.fadeOutFinish = nil

--- Determines if the moon is red, typically during the events of Bloodmoon.
---@type boolean
tes3moon.isRed = nil

--- Quick access back to the weather controller structure.
---@type tes3weatherController
tes3moon.weatherController = nil

---@type number
tes3moon.speed = nil

---@type number
tes3moon.fadeStartAngle = nil

---@type number
tes3moon.fadeEndAngle = nil

--- The texture to use for the moon.
---@type string
tes3moon.texture = nil


