local Snippets = require('snippets/Snippets')

local snippets = Snippets:new({})
snippets = Snippets.merge(snippets, require('snippets/personal/go'))
snippets = Snippets.merge(snippets, require('snippets/personal/sh'))
snippets = Snippets.merge(snippets, require('snippets/personal/proto'))
snippets = Snippets.merge(snippets, require('snippets/personal/python'))
snippets = Snippets.merge(snippets, require('snippets/personal/rust'))
snippets = Snippets.merge(snippets, require('snippets/personal/typescript'))

return snippets
