local Choice = classic:extend()

function Choice:new()
    self.text = ""
    self.index = 1
    self.threadAtGeneration = nil
    self.sourcePath = ""
    self.targetPath = nil
    self.isInvisibleDefault = false
    self.tags = {}
    self.originalThreadIndex = 1
end

function Choice:pathStringOnChoice()
    return self.targetPath:componentsString()
end

function Choice:setPathStringOnChoice(value)
    self.targetPath = Path:FromString(value)
end

function Choice:Clone()
    local copy = {}
    copy.text = self.text
    copy.sourcePath = self.sourcePath
    copy.index = self.index
    copy.targetPath = self.targetPath
    copy.originalThreadIndex = self.originalThreadIndex
    copy.isInvisibleDefault = self.isInvisibleDefault
    if self.threadAtGeneration ~= nil then
        copy.threadAtGeneration = self.threadAtGeneration
    end
    return copy
end

return Choice