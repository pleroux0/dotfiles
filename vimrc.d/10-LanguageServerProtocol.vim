" Install coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Completions
function! s:CocInstallAll()
  CocInstall coc-git
  CocInstall coc-gitignore
  CocInstall coc-highlight
  CocInstall coc-html
  CocInstall coc-json
  CocInstall coc-markdownlint
  CocInstall coc-python
  CocInstall coc-rls
  CocInstall coc-snippets
  CocInstall coc-texlab
  CocInstall coc-tsserver
  CocInstall coc-ultisnips
  CocInstall coc-vetur
  CocInstall coc-vimlsp
  CocInstall coc-yaml
endfunction

command! CocInstallAll call s:CocInstallAll()

function! s:CocConfigBash()
  call coc#config('languageserver.bash', {
  \    'command': 'bash-language-server',
  \    'args': ['start'],
  \    'filetypes': ['sh'],
  \    'ignoreRootPaths': ['~'],
  \})
endfunction

function! s:CocConfigDocker()
  call coc#config('languageserver.dockerfile', {
  \    'command': 'docker-langserver',
  \    'args': ['--stdio'],
  \    'filetypes': ['dockerfile'],
  \})
endfunction

function! s:CocConfigCcls()
  call coc#config('languageserver.ccls', {
  \    'command': 'ccls',
  \    'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
  \    'rootPatterns': ['compile_commands.json', '.git/'],
  \    'initializationOptions': {
  \        'cache': {
  \            'directory': '/tmp/ccls'
  \        }
  \    }
  \})
endfunction

function! s:CocConfigSnippets()
  " Setup snipts
  call coc#config('snippets.userSnippetsDirectory', '/home/pleroux/.vim/ultisnips')
  call coc#config('snippets.ultisnips.directories', ['UltiSnips', 'ultisnips'])

  " Snippets first
  call coc#config('snippets.priority', 100)
endfunction


function! s:CocConfigClangd()
  "Setup clangd
  call coc#config('languageserver.clangd', {
  \    'command': 'clangd',
  \    'args': ['--background-index'],
  \    'rootPatterns': ['compile_commands.json', '.git/'],
  \    'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
  \})
endfunction

function! s:CocConfigAll()
  call s:CocConfigBash()
  call s:CocConfigDocker()
  call s:CocConfigClangd()
  call s:CocConfigSnippets()
endfunction

augroup language_server_group
  autocmd!

  " Highlight on cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')
  setl formatexpr=CocAction('formatSelected')
augroup END

let g:airline#extensions#coc#enabled = 1

command! CocConfigAll call s:CocConfigAll()

command! -nargs=0 Format :call CocAction('format')
"command! -nargs=0 FormatSelected :call CocAction('formatSelected')
command! -nargs=0 JumpDeclaration :call CocAction('jumpDeclaration')
command! -nargs=0 JumpDefinition :call CocAction('jumpDefinition')
command! -nargs=0 JumpImplementation :call CocAction('jumpImplementation')
command! -nargs=0 JumpTypeDefinition :call CocAction('jumpTypeDefinition')
command! -nargs=0 Rename :call CocAction('rename')
command! -nargs=0 LatexBuild :call CocAction('runCommand', 'latex.Build')
command! -nargs=0 LatexBuildCancel :call CocAction('runCommand', 'latex.BuildCancel')

function s:ClangRename()
  let l:offset = line2byte(line("."))+col(".")
  let l:filename = "%"
  let l:new_name = input('Clang rename: ')
  exec ':!' . 'clang-rename ' . l:filename . ' -i -offset ' . l:offset . ' -new-name ' . l:new_name
  checktime
endfunction

command! -nargs=0 ClangRename call s:ClangRename()
