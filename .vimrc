" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'airblade/vim-rooter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'suan/vim-instant-markdown'
Plug 'Shougo/deoplete.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'mogelbrod/vim-jsonpath'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'w0rp/ale'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
call plug#end()

" scrooloose/nerdtree
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

" junegunn/goyo.vim
let g:goyo_width = '100%'
let g:goyo_height = '100%'
noremap! <C-w>o <Esc>:Goyo<CR>
nnoremap <C-w>o <Esc>:Goyo<CR>

" vim-gh-line
let g:gh_open_command = 'www '

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

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
\   'javascript': ['eslint'],
\   'html': ['tidy'],
\   'ocaml': ['ocamlformat'],
\}
let g:ale_javascript_eslint_executable = system('find-exec node_modules/.bin eslint')
let g:ale_javascript_eslint_use_global = 1
let g:ale_keep_list_window_open = 0
noremap! <C-F> <Esc>:ALEFix<CR>
nnoremap <C-F> <Esc>:ALEFix<CR>
" close error window when closing buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

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

" morhetz/gruvbox
set background=light
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox

" add NPM executables to PATH
let $PATH=getcwd() . "/node_modules/.bin:" . $PATH

" show an 80 column marker
set colorcolumn=80

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
