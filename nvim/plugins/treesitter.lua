local paq = require('paq').paq
paq {'nvim-treesitter/nvim-treesitter'}

-- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead

local treesitter = require 'nvim-treesitter.configs'
local parsers = require 'nvim-treesitter.parsers'.get_parser_configs()
local commentstring = require 'ts_context_commentstring'

treesitter.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "hcl",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rst",
        "rust",
        "starlark",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
    highlight = {enable = true},
    indent = {enable = true},
}

commentstring.setup {}

vim.g.skip_ts_context_commentstring_module = true

parsers.proto = {
    install_info = {
        url = "https://github.com/mitchellh/tree-sitter-proto.git",
        files = {"src/parser.c"},
        revision = "main"
    }
}
