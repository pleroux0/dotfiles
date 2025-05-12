local paq = require('paq').paq
paq {'L3MON4D3/LuaSnip'}

local ls = require('luasnip')
ls.config.setup { history = true }

for language, snippets in pairs(require('snippets/init').snippets) do
    ls.add_snippets(language, snippets)
end
