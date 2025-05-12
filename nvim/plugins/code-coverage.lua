local paq = require('paq').paq
paq {'andythigpen/nvim-coverage'}

require('coverage').setup({
    coomands = true,
})
