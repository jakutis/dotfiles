" junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ddrscott/vim-side-search'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'chrisbra/csv.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'airblade/vim-rooter'
Plug 'pangloss/vim-javascript'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'suan/vim-instant-markdown'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'easymotion/vim-easymotion'
Plug 'mogelbrod/vim-jsonpath'
Plug 'dense-analysis/ale'
Plug 'ruanyl/vim-gh-line'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rhubarb'
Plug 'bogado/file-line'
Plug 'editorconfig/editorconfig-vim'
Plug 'osyo-manga/vim-anzu'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
call plug#end()

source $HOME/.ideavimrc

packadd cfilter

" press CTRL-d to repeat previous ":" command
noremap <C-d> <Esc>:<Up><CR>

" to find text without using regex engine, enter ":Find your text to be found"
function! Find(needle)
  call search('\V' . escape(a:needle, '\'))
endfunction
command! -nargs=* -bang Find call Find(<q-args>)

" quick fix list
noremap <C-u> <Esc>:cp<CR>
noremap <C-i> <Esc>:cn<CR>

" vimgrep
set grepprg=rg\ --vimgrep\ -M\ 160\ -S

" clipboard
set clipboard=unnamed,unnamedplus

" spelling checking
set spell

" master keys
let mapleader = ","

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

" advised by https://github.com/autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascriptreact': ['typescript-language-server', '--stdio'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'scala': ['metals-vim'],
    \ }

" w0rp/ale
let g:ale_hover_cursor = 0
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescript': ['eslint', 'tslint'],
\   'typescriptreact': ['eslint', 'tslint'],
\}
let g:ale_fixers = {
\   'yaml': ['prettier'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescript': ['eslint', 'tslint'],
\   'typescriptreact': ['eslint', 'tslint'],
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
noremap! <leader>k <Esc>:ALEPrevious<CR>
nnoremap <leader>k <Esc>:ALEPrevious<CR>
noremap! <leader>j <Esc>:ALENext<CR>
nnoremap <leader>j <Esc>:ALENext<CR>

" close error window when closing buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" junegunn/fzf
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'VYTASROOT']
function! g:FzfSearch()
  let l:relative_dir = trim(system('realpath "--relative-to=' . getcwd() . '" "' . FindRootDirectory() . '"'))
  let l:relative_file = expand('%:p') == '' ? '.' : trim(system('realpath "--relative-to=' . FindRootDirectory() . '" "' . expand('%:p') . '"'))

  let l:fzf_options = join([
    \ '--keep-right --multi --preview-window noborder --prompt "> "',
    \ '--tiebreak=index',
    \ '--preview "bat --color always --style numbers,changes,snip {1}"',
    \ '--bind="ctrl-w:backward-kill-word,ctrl-u:clear-query"'], ' ')
  call fzf#vim#files('', {
    \ 'source': printf('rg --files "%s" | proximity-sort "%s"', l:relative_dir, l:relative_dir . '/' . l:relative_file),
    \ 'options': l:fzf_options
    \})
endfunction
noremap <C-p> :call g:FzfSearch()<CR>
function! FzfRipgrep(query, fullscreen)
  let l:root_dir = FindRootDirectory() 
  let l:relative_file = expand('%:p') == '' ? '.' : trim(system('realpath "--relative-to=' . l:root_dir . '" "' . expand('%:p') . '"'))

  let command_fmt = 'cd "' . l:root_dir . '" && rg --column --line-number --no-heading --color=always --smart-case -- %s | cut -d ":" -f 1-2 || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'dir': l:root_dir, 'options': ['--keep-right', '--multi', '--preview-window', 'noborder', '--prompt', '> ', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call FzfRipgrep(<q-args>, <bang>0)
noremap <C-q> <Esc>:Rg<CR>

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

" suan/vim-instant-markdown
let g:instant_markdown_autostart = 0

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
\ }

" ------------------------------------------------------------------------- CoC
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-sh']

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Find references
nmap <leader>ref <Plug>(coc-references)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" START copy of coc-completion-example
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(0) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(0) : "\<C-p>"

inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" FINISH copy of coc-completion-example

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
