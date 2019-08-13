
--- Represents a loaded ESM, ESP, or ESS file.
---@class tes3gameFile
tes3gameFile = {}

--- The path to the file.
---@type string
tes3gameFile.path = nil

--- The description of the file.
---@type string
tes3gameFile.description = nil

--- The current cell, from a save game.
---@type string
tes3gameFile.cellName = nil

--- The number of days passed, from a save game.
---@type number
tes3gameFile.daysPassed = nil

--- The simple filename.
---@type string
tes3gameFile.filename = nil

--- The current month, from a save game.
---@type number
tes3gameFile.month = nil

--- Deletes the file.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3gameFile/deleteFile.html).
---@type method
function tes3gameFile:deleteFile() end

--- The player's name, from a save game.
---@type string
tes3gameFile.playerName = nil

--- The file's author.
---@type string
tes3gameFile.author = nil

--- The size of the file.
---@type number
tes3gameFile.fileSize = nil

--- The current year, from a save game.
---@type number
tes3gameFile.year = nil

--- The current day, from a save game.
---@type number
tes3gameFile.day = nil

--- The current game hour, from a save game.
---@type number
tes3gameFile.gameHour = nil

--- The player's health, from a save game.
---@type number
tes3gameFile.currentHealth = nil

--- The player's maximum health, from a save game.
---@type number
tes3gameFile.maxHealth = nil

--- The timestamp that the file was modified.
---@type string
tes3gameFile.modifiedTime = nil


