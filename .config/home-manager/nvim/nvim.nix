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
    vim-gruvbox8
    vim-nix
    vimtex
    lualine-nvim
  ];

  extraLuaConfig = ''
    require("general")
    require("remap")
    require("lualine").setup()
  '';

  extraConfig = ''
    let &t_SI = "\<esc>[6 q"
    let &t_SR = "\<esc>[4 q"
    let &t_EI = "\<esc>[2 q"

    set statusline=\ %F%m%r%h\ %w\ \ PWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
    colorscheme gruvbox8_soft

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
