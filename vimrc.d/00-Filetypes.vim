
augroup filetype_group
  autocmd!

  " Azure pipelines
	autocmd BufRead,BufNewFile azure-pipelines*.yml setfiletype azure-pipelines
	autocmd BufRead,BufNewFile azure-pipelines*.yml set syntax=yaml
augroup END
