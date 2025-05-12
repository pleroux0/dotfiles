local paq = require('paq').paq
paq {'b3nj5m1n/kommentary'}
paq {'JoosepAlviste/nvim-ts-context-commentstring'}

vim.g.kommentary_create_default_mappings = false

config = require('kommentary.config')
config.config = {}
config.setup {}


config.configure_language("default", {
    prefer_single_line_comments=true,
})

config.configure_language({"cpp", "go"}, {
    single_line_comment_string="//",
    multi_line_comment_string={"/*", "*/"},
})

config.configure_language({"python", "toml"}, {
    single_line_comment_string="#",
})

config.configure_language("lua", {
    single_line_comment_string="--",
    multi_line_comment_string={"--[[", "--]"},
})


noremap = {}
-- noremap["noremap"] = true

vim.api.nvim_set_keymap("n", [[<C-_>]], "<Plug>kommentary_line_default", noremap)
vim.api.nvim_set_keymap("v", [[<C-_>]], "<Plug>kommentary_visual_default", noremap)
