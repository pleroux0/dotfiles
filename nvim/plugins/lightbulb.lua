local paq = require('paq').paq
paq {'kosayoda/nvim-lightbulb'}

require('nvim-lightbulb').update_lightbulb()

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
