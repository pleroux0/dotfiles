function s:terminal_run(cmd, buffer)
  let info = termopen(
    \  a:cmd,
    \  {
    \    'out_io': 'buffer',
    \    'out_name': a:buffer
    \  }
    \)
endfunction

command! MkDocsServe call s:terminal_run('mkdocs serve', 'MkDocsServerBuffer')
