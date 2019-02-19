" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'Quramy/tsuquyomi'
Plug 'sbdchd/neoformat'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'airblade/vim-rooter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lifepillar/vim-solarized8'
Plug 'suan/vim-instant-markdown'
Plug 'Shougo/deoplete.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'mogelbrod/vim-jsonpath'
Plug 'w0rp/ale'
call plug#end()

" ocaml
autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" advised by https://github.com/autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

" w0rp/ale
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\   'ocaml': ['ocamlformat'],
\}
noremap! <C-l> <Esc>:ALEFix<CR>
nnoremap <C-l> <Esc>:ALEFix<CR>

" mxw/vim-jsx
let g:jsx_ext_required = 0

" Quramy/tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_ocaml_checkers = ['merlin']

" vim-syntastic/syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_scss_checkers = []

" vim-airline/vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme='light'

" sbdchd/neoformat
let g:neoformat_enabled_html = []
let g:neoformat_enabled_scss = []
let g:neoformat_enabled_json = []
let g:neoformat_enabled_typescript = []
let g:neoformat_enabled_javascript = []

" junegunn/fzf
noremap! <C-p> <Esc>:execute 'FZF' fnameescape(FindRootDirectory())<CR>
nnoremap <C-p> <Esc>:execute 'FZF' fnameescape(FindRootDirectory())<CR>
noremap! <C-o> <Esc>:execute 'RipGrep'<CR>
nnoremap <C-o> <Esc>:execute 'RipGrep'<CR>
command! -bang -nargs=* RipGrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] },
  \   <bang>0)

" jremmen/vim-ripgrep
let g:rg_derive_root = 1
let g:rg_highlight = 1

" chriskempson/tomorrow-theme
set background=light
colorscheme solarized8
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" add NPM executables to PATH
let $PATH=getcwd() . "/node_modules/.bin:" . $PATH

" highlight current line
set cursorline

" security
set nomodeline

" master keys
let mapleader = ","

" saving
set noeol
set binary

" window management
set wmh=0
nmap <A-j> <c-w>j<c-w>_
nmap <A-k> <c-w>k<c-w>_

" persistent undo
set undodir=~/.vimundo
set undofile

" always show current filename
set laststatus=2

" line numbers
set norelativenumber
set number

" set current working directory to that of the file
set autochdir
autocmd BufEnter * lcd %:p:h
let g:rooter_manual_only = 1

" folding
set nofoldenable

" paste mode
let paste_mode = 0
set pastetoggle=<F9>

" no ^ and $ around lines
set nolist

" file formats
set ffs=unix
set ff=unix

" backups
set backup
set backupdir=~/.vimbackup

" swap file
set directory=~/.vimtmp
set hlsearch

" buffers
set nohidden

" indenting
set expandtab
set shiftround
set smarttab
set wildmenu
set wildmode=list:longest,full
set shiftwidth=2
set softtabstop=0
set autoindent
set backspace=2
set tabstop=2

" clipboard
set clipboard=unnamed,unnamedplus

" mouse
set mouse=

" searching
set ignorecase
set smartcase
set incsearch
nnoremap <CR> :noh<CR><CR>
