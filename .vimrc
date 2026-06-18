" move to nvim/lua/config/lazy.lua on demand
" Plug 'ddrscott/vim-side-search'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'kevinhwang91/rnvimr'
" Plug 'chrisbra/csv.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'posva/vim-vue'
" Plug 'airblade/vim-rooter'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'easymotion/vim-easymotion'
" Plug 'mogelbrod/vim-jsonpath'
" Plug 'ruanyl/vim-gh-line'
" Plug 'tpope/vim-rhubarb'
" Plug 'bogado/file-line'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'junegunn/goyo.vim'
" Plug 'meain/vim-printer'
" Plug 'matze/vim-move'
" Plug 'ptzz/lf.vim'
" Plug 'voldikss/vim-floaterm'

source $HOME/.ideavimrc
source $HOME/.vim/private.vim

packadd cfilter

function! g:RootRelativeFile()
  let l:currentpath = expand('%:p')
  let l:rootpath = FindRootDirectory()
  if (l:currentpath[0:len(l:rootpath)-1] == l:rootpath)
    return l:currentpath[len(l:rootpath)+1:len(l:currentpath)]
  endif
  return l:currentpath == '' ? '.' : l:currentpath
endfunction

" kevinhwang91/rnvimr
let g:rnvimr_enable_picker = 1
nnoremap <leader>r :RnvimrToggle<CR>

" ptzz/lf.vim
let g:lf_replace_netrw = 0
let g:lf_open_new_tab = 0
let g:lf_map_keys = 0
map <leader>f :Lf<CR>

" iamcco/markdown-preview.nvim
noremap <C-m> :MarkdownPreviewToggle<CR>

" meain/vim-printer
let g:vim_printer_items = {
      \ 'javascript': 'console.log("JAKUTIS", "{$}=", {$})',
      \ }

" press CTRL-d to repeat previous ":" command
noremap <C-d> <Esc>:<Up><CR>

" to find text without using regex engine, enter ":Find your text to be found"
function! Find(needle)
  call search('\V' . escape(a:needle, '\'))
endfunction
command! -nargs=* -bang Find call Find(<q-args>)

" vimgrep
set grepprg=rg\ --vimgrep\ -M\ 160\ -S

" clipboard
set clipboard=unnamed,unnamedplus

" spelling
set spell spelllang=en_us

" automatically commit & push if saved a wiki file
autocmd BufWritePost * silent! execute "!wiki-commit '%'"  | redraw!

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

" file types
autocmd BufNewFile,BufRead *.jsw set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact

" vim-gh-line
let g:gh_open_command = 'www '

" ocaml
autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" close error window when closing buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" colors
set background=light

" show an 80 column marker
set colorcolumn=80

" highlight current line
set cursorline

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

" do not break words when wrapping lines
set linebreak

" set current working directory to that of the file
set autochdir
let g:rooter_manual_only = 1

" folding
set foldlevel=999
set foldmethod=indent

" paste mode
let paste_mode = 0

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

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" matching braces
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

" do not add a space when joining lines with J
set nojoinspaces

" mouse
set mouse=

" window navigation
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

" start in the middle of :help and scroll with jk
autocmd VimEnter,WinEnter,BufWinEnter */doc/*.txt set scrolloff=999
autocmd BufLeave,WinLeave */doc/*.txt set scrolloff=2

" osyo-manga/vim-anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <Esc><Esc> :noh<CR><CR> \| <Plug>(anzu-clear-search-status)

" junegunn/goyo.vim
noremap! <C-g> <Esc>:Goyo<CR>
nnoremap <C-g> <Esc>:Goyo<CR>

" ddrscott/vim-side-search
let g:side_search_prg = 'rg'
  \. " --heading"
  \. " --stats"
  \. " -C 2"
  \. " --ignore-case"
  \. " --line-number"
let g:side_search_split_pct = 0.5
cabbrev SS SideSearch

" itchyny/lightline.vim
set noshowmode
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [['paste'], ['readonly', 'rootrelativefile', 'modified']],
\   'right': [['lineinfo']]
\ },
\ 'inactive': {
\   'left': [['rootrelativefile', 'modified']],
\   'right': [['lineinfo']]
\ },
\ 'component_function': {
\   'rootrelativefile': 'g:RootRelativeFile',
\ },
\ }

" 'matze/vim-move'
let g:move_map_keys = 0
nmap <C-w> <Plug>MoveLineUp
nmap <C-s> <Plug>MoveLineDown
vmap <C-q> <Plug>MoveBlockLeft
vmap <C-e> <Plug>MoveBlockRight
