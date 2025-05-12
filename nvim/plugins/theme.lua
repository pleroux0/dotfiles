local paq = require('paq').paq
paq {'marko-cerovac/material.nvim'}

material = require('material')

vim.g.material_style = "darker"

material.setup({
    plugins = {
        "dap",
        "gitsigns",
        "hop",
        "indent-blankline",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
    }
})

vim.cmd("colorscheme material")
