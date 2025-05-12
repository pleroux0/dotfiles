return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    config = function(_, opts)
    -- initialize hop
    require('hop').setup(opts)

    -- set up your easymotion-style mappings
    local noremap_silent = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("", "ew", ":HopWord<CR>", noremap_silent)
    vim.api.nvim_set_keymap("", "ec", ":HopChar1<CR>", noremap_silent)
    vim.api.nvim_set_keymap("", "el", ":HopLine<CR>", noremap_silent)
  end,
}
