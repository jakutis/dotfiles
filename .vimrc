" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'chrisbra/csv.vim'
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
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'mogelbrod/vim-jsonpath'
Plug 'w0rp/ale'
Plug 'ruanyl/vim-gh-line'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rhubarb'
Plug 'bogado/file-line'
Plug 'editorconfig/editorconfig-vim'
Plug 'osyo-manga/vim-anzu'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/vim-manpager'
Plug 'christoomey/vim-system-copy'
Plug 'junegunn/goyo.vim'
call plug#end()

packadd cfilter

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
\   'typescript': ['eslint', 'tslint'],
\   'scala': ['scalafmt'],
\   'json': ['jq'],
\   'html': ['tidy'],
\   'ocaml': ['ocamlformat'],
\}
let g:ale_javascript_eslint_use_global = 1
let g:ale_typescript_eslint_use_global = 1
let g:ale_typescript_tslint_use_global = 1
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
function! g:FzfSearch()
  let l:fzf_options = join([
    \ '--tiebreak=index',
    \ '-m --preview "bat --color always --style numbers,changes,snip {1}" --prompt "> " --preview-window noborder',
    \ '--bind="ctrl-w:backward-kill-word,ctrl-u:clear-query"'], ' ')
  let l:relative_dir = trim(system('realpath --relative-to=' . getcwd() . ' ' . FindRootDirectory()))
  let l:relative_file = expand('%:p') == '' ? '.' : trim(system('realpath --relative-to=' . FindRootDirectory() . ' ' . expand('%:p')))
  call fzf#vim#files('', {
    \ 'source': printf('rg --files %s | proximity-sort %s', l:relative_dir, l:relative_dir . '/' . l:relative_file),
    \ 'options': l:fzf_options
    \})
endfunction
noremap <C-p> :call g:FzfSearch()<CR>

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-sh']

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

" do not add a space when joining lines with J
set nojoinspaces

" mouse
set mouse=

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" window navigation
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-l> <C-w>l<C-w>_
nnoremap <C-q> <C-w>t<C-w>_
nnoremap <C-e> <C-w>b<C-w>_

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
