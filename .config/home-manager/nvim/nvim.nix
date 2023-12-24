{ pkgs, config, ... }:
{

  package = pkgs.neovim-unwrapped;
  enable = true;

  defaultEditor = true;

  viAlias = true;
  vimAlias = true;

  withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    nerdcommenter
    ultisnips
    vim-airline
    vim-airline-themes
    vim-gruvbox8
    vim-nix
    vimtex
  ];

  extraLuaConfig = ''
    require("general")
    require("remap")
  '';

  extraConfig = ''
    let &t_SI = "\<esc>[6 q"
    let &t_SR = "\<esc>[4 q"
    let &t_EI = "\<esc>[2 q"

    colorscheme gruvbox8_soft

    nnoremap <C-]> :bnext<CR>
    nnoremap <C-[> :bprevious<CR>
    nnoremap <C-p> :bdelete<CR>

    vnoremap <silent> * :<C-u>call VisualSelection(\'\', \'\')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection(\'\', \'\')<CR>?<C-R>=@/<CR><CR>

    map j gj
    map k gk
    map $ g$
    map 0 g0

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

    nnoremap <Esc>       <Esc>
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
