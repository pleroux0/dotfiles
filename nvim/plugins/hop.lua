local paq = require('paq').paq
paq {'phaazon/hop.nvim'}

require('hop').setup()

-- Use e for easymotion
vim.api.nvim_set_keymap("", "ew", ":HopWord<CR>", noremap)
vim.api.nvim_set_keymap("", "ec", ":HopChar1<CR>", noremap)
vim.api.nvim_set_keymap("", "el", ":HopLine<CR>", noremap)
