" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'airblade/vim-rooter'
call plug#end()

" vim-syntastic/syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']

" vim-airline/vim-airline
let g:airline_powerline_fonts = 0

" sbdchd/neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
function! neoformat#formatters#html#enabled() abort
    return []
endfunction
function! neoformat#formatters#scss#enabled() abort
    return []
endfunction
function! neoformat#formatters#json#enabled() abort
    return []
endfunction
function! neoformat#formatters#typescript#enabled() abort
    return []
endfunction
function! neoformat#formatters#typescript#prettier() abort
    return {
    \ 'exe': 'prettier',
    \ 'args': ['--single-quote', '--print-width', '100', '--parser', 'typescript'],
    \ 'stdin': 1
    \ }
endfunction
function! neoformat#formatters#javascript#enabled() abort
    return []
endfunction
function! neoformat#formatters#javascript#prettier() abort
    return {
    \ 'exe': 'prettier',
    \ 'args': ['--single-quote', '--print-width', '100', '--parser', 'typescript'],
    \ 'stdin': 1
    \ }
endfunction

" junegunn/fzf
noremap! <C-p> <Esc>:execute 'FZF' fnameescape(FindRootDirectory())<CR>
nnoremap <C-p> <Esc>:execute 'FZF' fnameescape(FindRootDirectory())<CR>

" chriskempson/tomorrow-theme
set background=light
colorscheme Tomorrow
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

" ^ and $ around lines
set list

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
set softtabstop=2
set autoindent
set backspace=2

" clipboard
set clipboard=unnamed,unnamedplus

" mouse
set mouse=

" searching
set ignorecase
set smartcase
set incsearch
nnoremap <CR> :noh<CR><CR>
