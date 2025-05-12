vim.cmd 'packadd paq-nvim'

package.path = '/home/pleroux/.config/nvim/?.lua;' .. package.path

local paq = require('paq').paq
paq{'savq/paq-nvim', opt=true}

require 'ui'

require 'plugins/abolish'
require 'plugins/cmp'
require 'plugins/code-coverage'
require 'plugins/crates'
require 'plugins/dap'
require 'plugins/feline'
require 'plugins/fold'
require 'plugins/filetype/golang'
require 'plugins/fugitive'
require 'plugins/gitsigns'
require 'plugins/grafana'
require 'plugins/hop'
require 'plugins/indent-blankline'
require 'plugins/kommentary'
require 'plugins/lightbulb'
require 'plugins/lsp'
require 'plugins/luasnip'
require 'plugins/nvim-tree'
require 'plugins/plenary'
require 'plugins/refactoring'
require 'plugins/telescope'
require 'plugins/test'
require 'plugins/theme'
require 'plugins/treesitter'
