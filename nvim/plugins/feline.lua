local paq = require('paq').paq

paq {'feline-nvim/feline.nvim'}

require('feline').setup {
    preset = "noicon",
    force_inactive = {
        filetypes = {
            'packer',
            'NvimTree',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}
