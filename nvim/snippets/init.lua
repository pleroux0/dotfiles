local Snippets = require('snippets/Snippets')

local snippets = Snippets:new({})
snippets = Snippets.merge(snippets, require('snippets/personal/init'))


-- print(vim.inspect(snippets))
return {["snippets"] = snippets}
