snippets = {}

function snippets:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function snippets.merge(left, right)
    output = snippets:new()

    function add(key, value)
        if output[key] == nil then
            output[key] = {}
        end

        for k, v in pairs(value) do
            table.insert(output[key], v)
        end
    end

    table.foreach(left, add)
    table.foreach(right, add)

    return output
end

return snippets
