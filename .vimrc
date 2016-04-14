set rtp+=~/.vimcustom
let dotfiles = readfile($XDG_CONFIG_HOME . "/dotfiles/dotfiles")[0]

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'raichoo/purescript-vim'
Plugin 'frigoeu/psc-ide-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'derekwyatt/vim-scala'
call vundle#end()
filetype plugin indent on
set laststatus=2

" window management
set wmh=0
nmap <A-j> <c-w>j<c-w>_
nmap <A-k> <c-w>k<c-w>_

" saving
set noeol
set binary

" highlight current line
set cursorline

" MRU
noremap! <C-o> <Esc>:MRU<CR>
nnoremap <C-o> <Esc>:MRU<CR>
let MRU_Filename_Format = {
        \   'formatter': 'v:val',
        \   'parser': '^.*$',
        \   'syntax': '^.*$'
        \}

" security
set nomodeline

" master keys
let mapleader = ","

" vim-scripts/taglist.vim
noremap! <F3> <Esc>:TlistToggle<CR>
nnoremap <F3> <Esc>:TlistToggle<CR>

" Go
set rtp+=$GOROOT/misc/vim

" Markdown
au! BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set ft=markdown
let tlist_markdown_settings = 'markdown;c:content;f:figures;t:tables;h:headlines'

" elzr/vim-json
au! BufRead,BufNewFile *.json set filetype=json

" LaTeX
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
" make verbatim environments appear as comments
autocmd VimEnter * syn region  texComment     start="\\begin{\w\+code}" end="\\end{\w\+code}" contains=@texCommentGroup

" scrooloose/syntastic
let g:syntastic_tex_chktex_args = "--inputfiles --nowarn 8"
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
     \ 'mode': 'active',
     \ 'active_filetypes': [],
     \ 'passive_filetypes': ['html', 'java', 'c', 'gcc', 'cpp'],
     \}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_php_phpmd_post_args = dotfiles . '/phpmd_ruleset.xml'
autocmd BufRead,BufNewFile *.scss let g:syntastic_scss_checkers=[]

" bling/vim-airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:jakutis_init_wd = getcwd()
let g:airline_section_c = '%{expand("%:p")[len(g:jakutis_init_wd):]}'

" chriskempson/tomorrow-theme
syntax on
set background=light
colorscheme Tomorrow
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" xolox/vim-misc
" xolox/vim-session
let g:session_autoload = 'no'
let g:session_directory = '~/.vimsession'
let g:session_autosave = 'yes'
set ssop-=options

" Chiel92/vim-autoformat
let g:formatprg_html = "tidy"
let g:formatprg_args_html = "-xml --quiet yes --indent yes --indent-spaces 4"

" bracket matching
runtime macros/matchit.vim
highlight MatchParen ctermbg=4

" 80 characters column
function! EnableColorColumn()
    match ErrorMsg '\%>80v.\+'
    if exists('+colorcolumn')
        set colorcolumn=80
    else
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        match OverLength /\%81v.\+/
    endif
endfunction
"autocmd BufRead,BufWrite COMMIT_EDITMSG,*.m,*.cpp,*.h,*.py,*.js,*.c,*.go,*.html,*.R call EnableColorColumn()

" line numbers
set relativenumber
set number

" current working directory
set autochdir

" folding
set nofoldenable

" paste mode
let paste_mode = 0
set pastetoggle=<F9>

" trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

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

" insertions
nnoremap <F1> <Esc>:let @1=system("date\|tr --delete '\n'")<CR>"1P
noremap! <F1> <Esc>:let @1=system("date\|tr --delete '\n'")<CR>"1pa

" ctags
nnoremap <F4> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" make
noremap! <F5> <Esc>:make!<CR>
nnoremap <F5> <Esc>:make!<CR>

" clipboard
set clipboard=unnamed,unnamedplus

" mouse
set mouse=

" searching
set ignorecase
set smartcase
set incsearch
nnoremap <CR> :noh<CR><CR>

" replacing
" http://stackoverflow.com/a/676619/113868
" By pressing ctrl + r in the visual mode you will be prompted to enter text
" to replace with. Press enter and then confirm each change you agree with 'y'
" or decline with 'n'.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'

" airblade/vim-gitgutter
let g:gitgutter_max_signs = 1000

" Lokaltog/vim-easymotion
map <Leader> <Plug>(easymotion-prefix)

" source all .vimrc files in all parent directories, except the main .vimrc
let dir = getcwd()
while 1
    if filereadable(dir . "/.vimrc") && dir != $HOME && dir != dotfiles
        execute "source " . dir . "/.vimrc"
        call MyVIMRC(dir)
    endif
    if dir == '/'
        break
    endif
    let dir = fnamemodify(expand(dir), ":h")
endwhile

" autoformat javascript on save
autocmd bufwritepost *.js silent !autoformat-js %
set autoread
