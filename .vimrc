" Author:
       "Alec Zabel_mena.
       "Based off of the .vimrc of Amir Salihefendic — @amix3k
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Plugins
"    -> Shortcuts
"    -> Filetypes
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nopaste
" Sets how many lines of history VIM has to remember
set history=500
set relativenumber

" This set the cursor to an i-beam on entering insert mode
" and revert back to a block when leaving. Keep replace mode
" as a block since it changes with insert mode as well.
" The following are codes for the various cursor shapes.
"   [1 is the blinky block cursor
"   [2 is the default (non-blinky) block cursor
"   [3 is blinky underscore
"   [4 fixed underscore
"   [5 i-beam (blinking)
"   [6 fixed i-beam

set cursorcolumn
set cursorline

let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[2 q"
let &t_EI = "\<esc>[2 q"

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Set up the path for fuzzy finding files.
set path+=**

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Clear search buffer.
command C let @/=""

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

colorscheme gruvbox

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'ryanoasis/vim-devicons'
    Plug 'lervag/vimtex'
    Plug 'vim-syntastic/syntastic'
    Plug 'preservim/nerdcommenter'

    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-surround'
call plug#end()

let g:SimpylFold_docstring_preview = 1

"=> Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_filetype_map = {
    \ "plaintex": "tex",
    \ "gentoo-metadata": "xml" }

let g:syntastic_mode_map = {
    \ "passive_filetypes": ["tex", "md", "markdown", "s"] }

"=> Vim Airline.
"let g:airline_theme='base16_gruvbox_dark_hard'

"=> NERDTree
"autocmd vimenter * NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
let NERDTreeNaturalSort=1
let NERDTreeCascadeSingleChildDir=0
map <C-n> :NERDTreeToggle<CR>
map <C-B> :NERDTreeFromBookmark<Space>
map <C-f> :NERDTreeFind<CR>
autocmd FileType nerdtree setlocal relativenumber

"=> vimtex
let g:tex_flavor='latex'
let g:vimtex_parser_bib_backend='bibtex'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"=> SimplyFold
let g:SimpylFold_docstring_preview = 1

"=> Autosaving
let g:auto_save = 0
augroup latex
    au!
    au FileType latex, tex let b:autosave = 1
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set undodir=/home/alec/.vim/undodir
set undofile

" Fix file types
autocmd BufRead, BufNewFile *.tex set filetype=tex
autocmd BufRead, BufNewFile *.cu set filetype cuda

" Clear whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" More indentation
set autoindent
set smartindent

" Linebreaking.
set linebreak
set textwidth=80        " Linebreak on 80 characters.
"set wrap                " Wrap the text around.
set nolist
set formatoptions+=t    " Keeps the linebreak formatting on editing lines.
set colorcolumn=81      " Set a color columnt to keep tabs on the margin.

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map j gj
map k gk

map $ g$
map 0 g0

" Map <Space> to / (search)
map <space> /

" Smart way to move between windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

map <leader>h :bright<cr>
map <leader>j :bup<cr>
map <leader>k :bdown<cr>
map <leader>l :bleft<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ PWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""0""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.*:call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set spelling.
autocmd Filetype tex, latex setlocal spell spelllang=en_us

set spelllang=en_gb

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap n nzz
noremap N Nzz

nnoremap <buffer> <Up> <Nop>
nnoremap <buffer> <Left> <Nop>
nnoremap <buffer> <Right> <Nop>
nnoremap <buffer> <Down> <Nop>
nnoremap <buffer> <BS> <Nop>
nnoremap <buffer> <Del> <Nop>
nnoremap <buffer> <PageUp> <Nop>
nnoremap <buffer> <PageDown> <Nop>
nnoremap <buffer> <Home> <Nop>
nnoremap <buffer> <End> <Nop>

inoremap <buffer> <Up> <Nop>
inoremap <buffer> <Left> <Nop>
inoremap <buffer> <Right> <Nop>
inoremap <buffer> <Down> <Nop>
inoremap <buffer> <PageUp> <Nop>
inoremap <buffer> <PageDown> <Nop>
inoremap <buffer> <Home> <Nop>
inoremap <buffer> <End> <Nop>

vnoremap <buffer> <Up> <Nop>
vnoremap <buffer> <Left> <Nop>
vnoremap <buffer> <Right> <Nop>
vnoremap <buffer> <Down> <Nop>
vnoremap <buffer> <BS> <Nop>
vnoremap <buffer> <Del> <Nop>
vnoremap <buffer> <PageUp> <Nop>
vnoremap <buffer> <PageDown> <Nop>
vnoremap <buffer> <Home> <Nop>
vnoremap <buffer> <End> <Nop>
