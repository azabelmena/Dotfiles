{pkgs, ...}:
{

    enable = true;

    plugins = with pkgs; [
      vimPlugins.nerdcommenter
      vimPlugins.syntastic
      vimPlugins.ultisnips
      vimPlugins.vim-airline
      vimPlugins.vim-nix
      vimPlugins.vimtex
    ];

    extraConfig = ''
set nocompatible
set nopaste
set pastetoggle=<F10>
set history=500
set relativenumber
set splitbelow
set cursorline
set cursorcolumn

let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[4 q"
let &t_EI = "\<esc>[2 q"

" Enable filetype plugins
filetype plugin on
filetype indent on

set autoread
au FocusGained,BufEnter * checktime

let mapleader = ","

set so=7

set path+=**

set wildmenu

set ruler

set cmdheight=1

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase

set smartcase

set hlsearch

set incsearch

command C let @/=""

set lazyredraw

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

set background=dark

colorscheme gruvbox

set encoding=utf8

set fileformats=unix

let g:netrw_banner = 0
let g:netrw_browssplit = 0
let g:netrw_liststyle = 1
let g:netrw_bufsettings = 'noma nomod nonu nowrap ro nobl'

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Ex!
    endif
endfunction

function! ToggleSex()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Sex!
    endif
endfunction

function! ToggleSex2()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Sex?
    endif
endfunction

noremap <silent> <C-N> :call ToggleNetrw()<CR>
noremap <silent> <C-S> :call ToggleSex()<CR>
noremap <silent> <C-B> :call ToggleSplit()<CR>
nnoremap <C-]> :bnext<CR>
nnoremap <C-[> :bprevious<CR>
nnoremap <C-p> :bdelete<CR>

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

let g:tex_flavor='latex'
let g:vimtex_parser_bib_backend='bibtex'
let g:vimtex_view_automatic = 0
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

set nobackup
set nowb
set noswapfile

set undodir=/home/alec/.vim/undodir
set undofile

autocmd BufRead, BufNewFile *.tex set filetype=tex
autocmd BufRead, BufNewFile *.cu set filetype=cuda

autocmd BufWritePre * %s/\s\+$//e

autocmd bufreadpre *.csv setlocal nowrap nolinebreak textwidth=0
autocmd bufreadpre *.c setlocal nowrap nolinebreak textwidth=0

set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set linebreak
set textwidth=80        " Linebreak on 80 characters.
set nowrap              " Don't wrap the text around.
set nolist
set formatoptions+=t    " Keeps the linebreak formatting on editing lines.
set colorcolumn=81      " Set a color columnt to keep tabs on the margin.

vnoremap <silent> * :<C-u>call VisualSelection(\'\', \'\')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection(\'\', \'\')<CR>?<C-R>=@/<CR><CR>

map j gj
map k gk
map $ g$
map 0 g0

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

map <leader>h :bright<cr>
map <leader>j :bup<cr>
map <leader>k :bdown<cr>
map <leader>l :bleft<cr>

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

au BufReadPost * if line("\'\"") > 1 && line("\'\"") <= line("$") | exe "normal! g\'\"" | endif

set laststatus=2

set statusline=\ %F%m%r%h\ %w\ \ PWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg(\'/\')
    silent! %s/\s\+$//e
    call setpos(\'.\', save_cursor)
    call setreg(\'/\', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.*:call CleanExtraSpaces()
endif


set nospell
set spelllang=en_us

highlight SpellBad    ctermfg=160      ctermbg=000     cterm=none

autocmd Filetype tex setlocal spell spelllang=en_us

map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>\'tzt\'m
noremap J     <C-d>zz
noremap K     <C-u>zz
noremap n nzz
noremap N Nzz

nnoremap <Up>       <Nop>
nnoremap <Left>     <Nop>
nnoremap <Right>    <Nop>
nnoremap <Down>     <Nop>
nnoremap <Down>     <Nop>
nnoremap <PageUp>   <Nop>
nnoremap <PageDown> <Nop>

inoremap <Up>       <Nop>
inoremap <Left>     <Nop>
inoremap <Right>    <Nop>
inoremap <Down>     <Nop>
inoremap <Down>     <Nop>

vnoremap <Up> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Down> <Nop>
vnoremap <Down> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>
    '';
}
