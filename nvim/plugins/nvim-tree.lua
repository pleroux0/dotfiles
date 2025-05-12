local paq = require('paq').paq

paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}

require('nvim-web-devicons').setup {}

vim.api.nvim_command("command! Tree NvimTreeOpen")

nvim_tree = require 'nvim-tree'

nvim_tree.setup {
  filters = {
    dotfiles = false,
    custom = {
        "\\.cache",
        "\\.clangd",
        "\\.git",
        "\\.mypy_cache",
        "\\.pytest_cache",
        "\\.venv",
        "\\.ropeproject",
        "__pycache__",
    }
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
}
