-- Bootstrap NeoVIM
require('bootstrap')

-- Use default leader keys

-- Load plugins
require('lazy').setup({
  spec = {
    { import = "plugins" },
    { import = "plugins/filetypes" },
  },
})
