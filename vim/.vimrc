" vim: set foldmethod=marker foldlevel=0:
" =============================================================================
" Schmidmt's .vimrc {{{
" =============================================================================


" }}}
" =============================================================================
" Plugins Block {{{
" =============================================================================

filetype off
silent! if plug#begin('~/.vim/plugged')

" Colors
" Plug 'hzchirs/vim-material'
" Plug 'MaxSt/FlatColor'
Plug 'mhartington/oceanic-next'
" Plug 'altercation/vim-colors-solarized'
" Plug 'gosukiwi/vim-atom-dark'
" Plug 'tomasr/molokai'
" Plug 'croaky/vim-colors-github'
" Plug 'cseelus/vim-colors-clearance'
" Plug 'vim-scripts/rdark-terminal'
" Plug 'vim-scripts/miko'
" Plug 'vim-scripts/Gentooish'
" Plug 'NLKNguyen/papercolor-theme'
"Plug 'lu-ren/SerialExperimentsLain'

" Edit
" Plug 'davidbeckingsale/writegood.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'scrooloose/nerdcommenter'
" Plug 'suan/vim-instant-markdown'
" Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Lang
"Plug 'JuliaLang/julia-vim', {'for': 'julia'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'adimit/prolog.vim', {'for': 'prolog'}
Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'honza/dockerfile.vim', {'for': 'dockerfile'}
Plug 'keith/tmux.vim', {'for': 'tmux'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'moll/vim-node', {'for': 'node'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'plasticboy/vim-markdown', {'for': 'mkd'}
Plug 'uarun/vim-protobuf'
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'derekwyatt/vim-scala'
" Plug 'racer-rust/vim-racer'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Code Management
Plug 'w0rp/ale'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'albfan/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
if v:version >= 703
  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
endif
Plug 'vim-scripts/a.vim'
"
"Plug 'maralla/completor.vim'
Plug 'FooSoft/vim-argwrap' 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Misc
Plug 'Yggdroot/indentLine'
Plug 'jamessan/vim-gnupg'
Plug 'rhysd/vim-grammarous'
Plug 'mhinz/vim-rfc'
"Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'takac/vim-hardtime'
Plug 'romainl/vim-cool'
Plug 'janko-m/vim-test'

Plug 'vim-scripts/Vim-R-plugin'
Plug 'maverickg/stan.vim'


Plug 'natebosch/vim-lsc'

call plug#end()
endif

" }}}
" =============================================================================
" Basic Settings {{{
" =============================================================================

set nocompatible
set autoindent
set autoread
set history=50
set number
set background=dark
set nowrap
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
set wildmode=longest,list,full
set wildmenu
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ef :Ftedit()<CR>

"Disable arrow keys

"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

filetype plugin indent on

silent! colorscheme OceanicNext

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

" }}}
" =============================================================================
" Clipboard Config {{{
" =============================================================================
" function! ClipboardYank()
"   call system('xclip -i -selection clipboard', @@)
" endfunction
" function! ClipboardPaste()
"   let @@ = system('xclip -o -selection clipboard')
" endfunction
" 
" vnoremap <silent> y y:call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>p

" }}}
" =============================================================================
" CScope Config {{{
" =============================================================================

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

" }}}
" =============================================================================
" Hilighting Config {{{
" =============================================================================

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" }}}
" =============================================================================
" Helpful Mappings {{{
" =============================================================================

" ----------------------------------------------------------------------------
" Syntax highlighting in code snippets
" ----------------------------------------------------------------------------
function! s:syntax_include(lang, b, e, inclusive)
  let syns = split(globpath(&rtp, "syntax/".a:lang.".vim"), "\n")
  if empty(syns)
    return
  endif

  if exists('b:current_syntax')
    let csyn = b:current_syntax
    unlet b:current_syntax
  endif

  let z = "'" " Default
  for nr in range(char2nr('a'), char2nr('z'))
    let char = nr2char(nr)
    if a:b !~ char && a:e !~ char
      let z = char
      break
    endif
  endfor

  silent! exec printf("syntax include @%s %s", a:lang, syns[0])
  if a:inclusive
    exec printf('syntax region %sSnip start=%s\(%s\)\@=%s ' .
                \ 'end=%s\(%s\)\@<=\(\)%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  else
    exec printf('syntax region %sSnip matchgroup=Snip start=%s%s%s ' .
                \ 'end=%s%s%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  endif

  if exists('csyn')
    let b:current_syntax = csyn
  endif
endfunction

function! s:file_type_handler()
  if &ft =~ 'jinja' && &ft != 'jinja'
    call s:syntax_include('jinja', '{{', '}}', 1)
    call s:syntax_include('jinja', '{%', '%}', 1)
  elseif &ft == 'mkd' || &ft == 'markdown'
    let map = { 'bash': 'sh' }
    for lang in ['ruby', 'yaml', 'vim', 'sh', 'bash', 'python', 'java', 'c', 'sql', 'gnuplot']
      call s:syntax_include(get(map, lang, lang), '```'.lang, '```', 0)
    endfor

    highlight def link Snip Folded

    setlocal textwidth=78
    setlocal completefunc=emoji#complete
  elseif &ft == 'sh'
    call s:syntax_include('ruby', '#!ruby', '/\%$', 1)
  endif
endfunction

" ----------------------------------------------------------------------------
" :Chomp
" ----------------------------------------------------------------------------
command! Chomp silent! normal! :%s/\s\+$//<cr> :noh<cr>

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let me = expand('%:p:h')
  let gitd = finddir('.git', me.';')
  if empty(gitd)
    echo "Not in git repo"
  else
    let gitp = fnamemodify(gitd, ':h')
    echo "Change directory to: ".gitp
    execute 'lcd' gitp
  endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            filetype quick edit                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ftedit()
  let ftfile = $HOME."/.vim/ftplugin/".&filetype.".vim"
  execute "split" . ftfile
endfunction
command! Ftedit call s:ftedit()


" }}}
" =============================================================================
" Plugins {{{
" =============================================================================

" ----------------------------------------------------------------------------
" matchit.vim
" ----------------------------------------------------------------------------
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" ----------------------------------------------------------------------------
" NERDTree Config
" ----------------------------------------------------------------------------
nmap <silent> <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.swp$']
if has("gui_running")
  "autocmd VimEnter * NERDTree
  "autocmd VimEnter * wincmd p
endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ----------------------------------------------------------------------------
" TagBar Config
" ----------------------------------------------------------------------------
nmap <silent> <leader>tb :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" UtliSnips Config
" ----------------------------------------------------------------------------
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_email='schmidmt@gmail.com'

" ----------------------------------------------------------------------------
" NETrw
" ----------------------------------------------------------------------------
let g:netrw_banner = 0

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
endif

let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
endif

" ----------------------------------------------------------------------------
" Racer
" ----------------------------------------------------------------------------
let g:completor_racer_binary = "/Users/mschmidt/.cargo/bin/racer"

" ----------------------------------------------------------------------------
" Scala
" ----------------------------------------------------------------------------
au BufRead,BufNewFile *.sbt set filetype=scala

let g:lsc_enable_autocomplete = v:false
let g:lsc_server_commands = {
  \  'scala': {
  \    'command': 'metals-vim',
  \    'log_level': 'Log'
  \  }
  \}
let g:lsc_auto_map = {
  \  'GoToDefinition': 'gd',
  \}

" }}}
