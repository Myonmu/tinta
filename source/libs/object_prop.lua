---@class ObjectPropertyHelper Helper that creates getters and setters
local ObjectPropertyHelper

---@class ObjectProperty
---@field get function
---@field set function

--- Try to index properties first
local function __index(table, index)
    local meta = getmetatable(table)
    local prop = meta.properties[index]
    if prop then
        return prop.get(table)
    else
        return rawget(table, index)
    end
end

local function __newindex(table, index, value)
    local meta = getmetatable(table)
    local prop = meta.properties[index]
    if prop then
        prop.set(table, value)
    else
        rawset(table, index, value)
    end
end

function ObjectPropertyHelper.SetupObject(object, properties)
    local originalMeta = getmetatable(object)
    originalMeta.__index = __index
    originalMeta.__newindex = __newindex
    object.properties = properties or {}
    setmetatable(object, originalMeta)
end