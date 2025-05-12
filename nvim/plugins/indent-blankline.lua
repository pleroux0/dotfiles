local paq = require('paq').paq
paq {'lukas-reineke/indent-blankline.nvim'}

vim.go.listchars = "eol:↲,extends:⟩,precedes:⟨,tab:→ "
vim.wo.list = true

require("ibl").setup {
    scope = {
        enabled = true,
    },
}

-- filetypes = {
--     "cpp","c", "bash", "lua", "python", "go",
-- },
