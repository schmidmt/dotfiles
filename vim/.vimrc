execute pathogen#infect()

set runtimepath+=$HOME/.vim/writegood.vim

set nocompatible
set autoindent
set autoread
set history=50
set number              
set smartindent
set background=dark
colorscheme flatcolor

filetype on " Turn on Filetype Detection

set expandtab
set tabstop=2
set shiftwidth=2

"autocmd FileType python setlocal shiftwidth=4
"autocmd FileType python setlocal tabstop=4

set nowrap

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start         " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

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


" Set the maximum line width
"set wrapmargin=70

" Make sure indenting is clean for a specific language
"filetype on
"filetype indent on
"filetype plugin on
"
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']
