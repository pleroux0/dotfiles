vim.wo.number = true
vim.o.mouse = "a"

vim.go.expandtab = true
vim.go.tabstop = 4
vim.go.shiftwidth = 0
vim.go.softtabstop = 0
vim.go.wrap = true
vim.o.termguicolors = true

vim.o.updatetime = 1000

noremap = {}
noremap["noremap"] = true

-- VimEx completion
vim.go.wildmenu = true
vim.go.wildmode = "full:longest,full"

-- Window movements
vim.api.nvim_set_keymap("", [[<M-Left>]], "<C-W>h", noremap)
vim.api.nvim_set_keymap("", [[<M-Right>]], "<C-W>l", noremap)
vim.api.nvim_set_keymap("", [[<M-Up>]], "<C-W>k", noremap)
vim.api.nvim_set_keymap("", [[<M-Down>]], "<C-W>j", noremap)

vim.api.nvim_set_keymap("", [[<M-h>]], "<C-W>h", noremap)
vim.api.nvim_set_keymap("", [[<M-l>]], "<C-W>l", noremap)
vim.api.nvim_set_keymap("", [[<M-k>]], "<C-W>k", noremap)
vim.api.nvim_set_keymap("", [[<M-j>]], "<C-W>j", noremap)

-- Terminal
vim.api.nvim_set_keymap("t", [[<Esc>]], "<C-\\><C-n>", noremap)
