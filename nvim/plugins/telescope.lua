local paq = require('paq').paq
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzf-native.nvim'}

telescope = require('telescope')
telescope.setup({})

noremap = {}
noremap["noremap"] = true

-- File
vim.api.nvim_set_keymap("", "tf", ":Telescope git_files<CR>", noremap)
vim.api.nvim_set_keymap("", "tg", ":Telescope live_grep<CR>", noremap)

-- Vim
vim.api.nvim_set_keymap("", "tq", ":Telescope quick_fix<CR>", noremap)

-- LSP
vim.api.nvim_set_keymap("", "tlr", ":Telescope lsp_references<CR>", noremap)
vim.api.nvim_set_keymap("", "tlds", ":Telescope lsp_document_symbols<CR>", noremap)
vim.api.nvim_set_keymap("", "tlws", ":Telescope lsp_workspace_symbols<CR>", noremap)
vim.api.nvim_set_keymap("", "tlca", ":Telescope lsp_code_actions<CR>", noremap)
vim.api.nvim_set_keymap("", "tlrca", ":Telescope lsp_range_code_actions<CR>", noremap)
vim.api.nvim_set_keymap("", "td", ":Telescope diagnostics<CR>", noremap)
vim.api.nvim_set_keymap("", "tli", ":Telescope lsp_implementations<CR>", noremap)
vim.api.nvim_set_keymap("", "tld", ":Telescope lsp_definitions<CR>", noremap)
vim.api.nvim_set_keymap("", "tltd", ":Telescope lsp_type_definitions<CR>", noremap)

require('telescope').load_extension('fzf')
