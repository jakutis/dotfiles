" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'metakirby5/codi.vim'
Plug 'airblade/vim-rooter'
Plug 'pangloss/vim-javascript'
Plug 'udalov/kotlin-vim'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'suan/vim-instant-markdown'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'fszymanski/deoplete-emoji'
Plug 'deathlyfrantic/deoplete-spell'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'mogelbrod/vim-jsonpath'
Plug 'w0rp/ale'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rhubarb'
Plug 'bogado/file-line'
call plug#end()

" master keys
let mapleader = ","

" hex editing
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" wix
autocmd BufNewFile,BufRead *.jsw set filetype=javascript

" scrooloose/nerdtree
nmap ,n :NERDTreeFind<CR>
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END
" https://yous.be/2014/11/30/automatically-quit-vim-if-actual-files-are-closed/
function! CloseAllIfNothingImportantIsOpen()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CloseAllIfNothingImportantIsOpen()

" junegunn/goyo.vim
let g:goyo_width = '100%'
let g:goyo_height = '100%'
noremap! <C-w>o <Esc>:Goyo<CR>
nnoremap <C-w>o <Esc>:Goyo<CR>

" vim-gh-line
let g:gh_open_command = 'www '

" ocaml
autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" advised by https://github.com/autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'scala': ['metals-vim'],
    \ }
let g:LanguageClient_windowLogMessageLevel = 'Log'
let g:LanguageClient_hoverPreview = 'Always'

" w0rp/ale
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_linters = {
\   'typescript': ['tslint'],
\}
let g:ale_fixers = {
\   'yaml': ['prettier'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'prettier', 'tslint'],
\   'scala': ['scalafmt'],
\   'json': ['jq'],
\   'html': ['tidy'],
\   'ocaml': ['ocamlformat'],
\}
let g:ale_javascript_eslint_executable = system('find-exec node_modules/.bin eslint')
let g:ale_javascript_eslint_use_global = 1
let g:ale_keep_list_window_open = 0
noremap! <C-s> <Esc>:ALEFix<CR>
nnoremap <C-s> <Esc>:ALEFix<CR>
" close error window when closing buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" mxw/vim-jsx
let g:jsx_ext_required = 0

" vim-airline/vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme='light'
let g:airline_section_a = airline#section#create_left([])
let g:airline_section_b = airline#section#create_right(['filetype'])
let g:airline_section_c = airline#section#create(['%<', 'path', 'readonly'])
let g:airline_section_x = airline#section#create([])
let g:airline_section_y = airline#section#create_right([])
let g:airline_section_z = airline#section#create(['mode', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert', ' %v'])

" junegunn/fzf
nmap <leader>/ :BLines<cr>
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

" show an 80 column marker
set colorcolumn=80

" highlight current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=yellow
highlight CursorLineNr cterm=NONE ctermbg=yellow

" security
set nomodeline

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
set foldmethod=indent

" paste mode
let paste_mode = 0
set pastetoggle=<F9>

" no ^ and $ around lines
set list
set listchars=tab:>-

" file formats
set ffs=unix
set ff=unix

" backups
set backup
set backupdir=~/.vimbackup

" swap file
set directory=~/.vimtmp

" buffers
set nohidden

" matching braces
set showmatch
set matchpairs=(:),{:},[:],<:>

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
autocmd Filetype kotlin setlocal tabstop=4 shiftwidth=4

" clipboard
set clipboard=unnamed,unnamedplus

" do not add a space when joining lines with J
set nojoinspaces

" mouse
set mouse=

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <CR> :noh<CR><CR>

" window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>t
nnoremap <C-e> <C-w>b

" deoplete
set pyxversion=3
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_length'])
