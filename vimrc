" VIM setup
" =========

" Use python virtualenv
let g:python3_host_prog = '/home/pleroux/.pyenv/versions/vim/bin/python'

""" Plugin begin
""" ============
call plug#begin('~/.vim/plugged')

" Source ~/.vimrc.d
" =================
let vimrc_d_files = split(globpath('~/.vimrc.d/', '*.vim'), '\n')
for fpath in sort(vimrc_d_files)
  exec 'source' fpath
endfor

Plug 'pleroux0/my.vim'

" VimL completion

" Improve UI
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomasiser/vim-code-dark'
Plug 'mbbill/undotree'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" File navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

"Other
Plug 'junegunn/vader.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dylon/vim-antlr'
" Plug 'lervag/vimtex'

""" Plugin end
""" ==========
call plug#end()

" Enable theme
colorscheme codedark

CocConfigAll

command! EditSnippets exec 'e ~/.vim/ultisnips/' .. &filetype .. '.snippets'
command! TabeSnippets exec 'tabe ~/.vim/ultisnips/' .. &filetype .. '.snippets'
command! VSplitSnippets exec 'vsplit ~/.vim/ultisnips/' .. &filetype .. '.snippets'
command! SplitSnippets exec 'split ~/.vim/ultisnips/' .. &filetype .. '.snippets'

" Enable mouse support
set mouse=a

" Show current column
set ruler
set number

" Enable movements (Alt + Direction)
noremap <M-Left> <C-W>h
noremap <M-Right> <C-W>l
noremap <M-Up> <C-W>k
noremap <M-Down> <C-W>j

noremap <M-h> <C-W>h
noremap <M-l> <C-W>l
noremap <M-k> <C-W>k
noremap <M-j> <C-W>j

" Command autocomplete
set wildmenu
set wildmode=longest:full,full

" Set tab/space width
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set indentexpr=

" Sudo write
cmap w!! w !sudo tee > /dev/null %

" Highlight all search matches
set hlsearch

" Plugin configuration
" ====================

" Language Server Protocol
" ------------------------

set hidden

" Display errors in airline
let g:airline#extensions#ale#enabled = 1

" Ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = '/home/pleroux/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'ultisnips']
let g:UltiSnipsEditSplit = 'tabdo'

" gitgutter
set updatetime=50

" File types
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
au BufRead,BufNewFile,FileType cmake set indentexpr=

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set textwidth=0     |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix |

" NERDTree
let NERDTreeShowHidden=1

let NERDTreeIgnore=[
  \ '\.egg-info$',
  \ '^\.mypy_cache$',
  \ '^__pycache__$',
  \ '^.pytest_cache$',
  \ '^pip-wheel-metadata$[[dir]]',
  \ '^.idea$',
  \ '^.git'
  \ ]

" Highlight trailing whitespace
let g:better_whitespace_enabled=1

" Highlight mixed tabs and spaces
let g:show_spaces_that_precede_tabs=1

" Enable indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=1

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

" Unix Line Endings
set fileformat=unix
