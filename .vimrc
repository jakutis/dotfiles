set rtp+=$GOROOT/misc/vim
" ------------------ begin VUNDLE -------------------------
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'editorconfig-vim'
Bundle 'Screen-vim---gnu-screentmux'
Bundle 'Markdown'
Bundle 'fugitive.vim'
"Bundle 'instant-markdown.vim'
"Bundle 'simple-pairs'
Bundle 'Markdown-syntax'
Bundle 'Textile-for-VIM'
Bundle 'Syntastic'
Bundle 'JSON.vim'
Bundle 'Command-T'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
"Bundle 'localvimrc'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'Vim-R-plugin'
Bundle 'ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'Chiel92/vim-autoformat'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'dbext.vim'
Bundle 'bling/vim-airline'

filetype plugin indent on

let g:session_autoload = 'no'

let g:formatprg_html = "tidy"
let g:formatprg_args_html = "-xml --quiet yes --indent yes --indent-spaces 4"

let g:syntastic_tex_chktex_args = "--inputfiles --nowarn 8"
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html', 'java', 'c', 'gcc', 'cpp'] }
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checker = 'jshint'

let g:localvimrc_ask = 0
let g:localvimrc_name = '.lvimrc'
let g:localvimrc_count = -1
let g:localvimrc_sandbox = 0

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts = 1

let vimrplugin_term = 'urxvt'
let vimrplugin_term_cmd = 'urxvt -e'
let vimrplugin_rnowebchunk = 0
let vimrplugin_underscore = 0
let mapleader = ","

au! BufRead,BufNewFile *.json set filetype=json

"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd l

let g:session_directory = '~/.vimsession'
let g:session_autosave = 'yes'

" ------------------ end VUNDLE -------------------------

runtime macros/matchit.vim

set relativenumber
set autochdir
set nofoldenable

set guifont=Menlo\ 10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=b  "remove horizontal scroll bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=R  "remove right-hand scroll bar when vsp
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar when vsp

syntax on
set background=light
colorscheme Tomorrow

function! EnableColorColumn()
    match ErrorMsg '\%>80v.\+'
    if exists('+colorcolumn')
        set colorcolumn=80
    else
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        match OverLength /\%81v.\+/
    endif
endfunction

autocmd BufRead,BufWrite COMMIT_EDITMSG,*.m,*.cpp,*.h,*.py,*.js,*.c,*.go,*.html,*.R call EnableColorColumn()

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set laststatus=2
set statusline=%t%r\ %y\ format:\ %{&ff};\ [%l,%c=%b]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set list

" Necesary  for lots of cool vim things

" This shows what you are typing as a command.  I love this!
set showcmd

set ffs=unix
set ff=unix
set backup
set backupdir=~/.vimbackup
set directory=~/.vimtmp
set hlsearch

" Set off the other paren
highlight MatchParen ctermbg=4

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

set expandtab
set smarttab

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

set shiftwidth=4
set softtabstop=4
set autoindent

nnoremap <F1> <Esc>:let @1=system("date\|tr --delete '\n'")<CR>"1P
noremap! <F1> <Esc>:let @1=system("date\|tr --delete '\n'")<CR>"1pa

nnoremap <F2> <Esc>:let @1=system("cat $HOME/Desktop/DOTFILES/c_fun.tpl")<CR>"1P
noremap! <F2> <Esc>:let @1=system("cat $HOME/Desktop/DOTFILES/c_fun.tpl")<CR>"1pa

nnoremap <F4> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

noremap! <F5> <Esc>:make!<CR>
nnoremap <F5> <Esc>:make!<CR>

nnoremap <F8> <Esc>:call system('xclip -selection clipboard', @0)<CR>

set pastetoggle=<F9>

noremap! <F10> <Esc>:tabp<CR>
nnoremap <F10> <Esc>:tabp<CR>

noremap! <F11> <Esc>:tabnew<CR>
nnoremap <F11> <Esc>:tabnew<CR>

noremap! <F12> <Esc>:tabn<CR>
nnoremap <F12> <Esc>:tabn<CR>

cmap w!! %!sudo tee > /dev/null %

nnoremap <CR> :noh<CR><CR>

nnoremap ; :
nnoremap : ;

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
set incsearch


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'

let g:Tex_CompileRule_pdf = 'xelatex -shell-escape --interaction=nonstopmode $*'


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" http://stackoverflow.com/a/676619/113868
" By pressing ctrl + r in the visual mode you will be prompted to enter text
" to replace with. Press enter and then confirm each change you agree with 'y'
" or decline with 'n'.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

set guifont=Source\ Code\ Pro\ 11

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype octave set omnifunc=syntaxcomplete#Complete

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \}
