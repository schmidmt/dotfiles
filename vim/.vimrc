set nocompatible
set autoindent
set autoread
set history=50
set number
set smartindent
set background=dark
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set colorcolumn=80
set bs=indent,eol,start
set viminfo='20,\"50
set history=50
set ruler
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set noswapfile
set nobackup
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has("gui_running")
  set list
endif

"pumvisible() ? "\pumvisible" : "\

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'powerline/powerline',{'rtp': 'powerline/bindings/vim/'}
"Plugin 'gregsexton/MatchTag'
"Plugin 'walm/jshint.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'pangloss/vim-javascript'
"Plugin 'lepture/vim-jinja'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'elzr/vim-json'
"Plugin 'lervag/vim-latex'
"Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'moll/vim-node'
Plugin 'davidbeckingsale/writegood.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'MaxSt/FlatColor'
"Plugin 'tomasr/molokai'
"Plugin 'croaky/vim-colors-github'
"Plugin 'gmarik/ingretu'
"Plugin 'vim-scripts/BusyBee'
"Plugin 'vim-scripts/proton'
"Plugin 'cseelus/vim-colors-clearance'
"Plugin 'vim-scripts/rdark-terminal'
"Plugin 'vim-scripts/miko'
"Plugin 'vim-scripts/Gentooish'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-fugitive'
"Plugin 'sjl/splice.vim'
"Plugin 'Townk/vim-autoclose' "Probably Causes issues
Plugin 'vim-scripts/a.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'google/vim-maktaba'
"Plugin 'google/vim-codefmtlib'
"Plugin 'google/vim-codefmt'
"Plugin 'google/vim-glaive'
call vundle#end()
filetype plugin indent on

let g:flatcolor_asphaltbg=0

colorscheme flatcolor

" From http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


"" Code Format
"
"call glaive#Install()
"Glaive codefmt plugin[mappings]

""" UtliSnips Config

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst 
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


"" NerdTree Config
"
nmap <silent> <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']
if has("gui_running")
  "autocmd VimEnter * NERDTree
  "autocmd VimEnter * wincmd p
endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Tagbar
"
nmap <silent> <leader>tb :TagbarToggle<CR>


if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif
