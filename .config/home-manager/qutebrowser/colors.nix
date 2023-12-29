{ pkgs, config, ...}:
{
  completion = {
    fg = "#${config.colorScheme.colors.base06}";
    odd.bg = "#${config.colorScheme.colors.base00}";
    even.bg = "#${config.colorScheme.colors.base00}";

    category = {
      bg = "#${config.colorScheme.colors.base0C}";
      fg = "#${config.colorScheme.colors.base0C}";

      border.top    ="#${config.colorScheme.colors.base0D}";
      border.bottom ="#${config.colorScheme.colors.base0D}";
    };

    item = {
      selected.fg = "#${config.colorScheme.colors.base07}";
      selected.bg = "#${config.colorscheme.colors.base02}";
      selected.border.top = "#${config.colorscheme.colors.base02}";
      selected.border.bottom = "#${config.colorscheme.colors.base02}";
      selected.match.fg = "#${config.colorScheme.colors.base09}";
    };

    match.fg = "#${config.colorScheme.colors.base09}";

    scrollbar.fg = "#${config.colorScheme.colors.base09}";
    scrollbar.bg = "#${config.colorScheme.colors.base0D}";

  };

  contextmenu = {
    disabled.bg = "#${config.colorScheme.colors.base03}";
    disabled.fg = "#${config.colorScheme.colors.base04}";

    menu.bg = "#${config.colorScheme.colors.base00}";
    menu.fg = "#${config.colorScheme.colors.base05}";

    selected.fg = "#${config.colorScheme.colors.base02}";
    selected.bg = "#${config.colorScheme.colors.base02}";
  };

  downloads = {
    bar.bg = "#${config.colorScheme.colors.base00}";

    start.fg = "#${config.colorScheme.colors.base00}";
    start.bg = "#${config.colorScheme.colors.base0B}";
    stop.fg = "#${config.colorScheme.colors.base00}";
    stop.bg = "#${config.colorScheme.colors.base0D}";
    error.fg = "#${config.colorScheme.colors.base08}";
  };

  hints = {
    fg = "#${config.colorScheme.colors.base00}";
    bg = "#${config.colorScheme.colors.base0A}";

    match.fg = "#${config.colorScheme.colors.base02}";
  };

  keyhint = {
    fg = "#${config.colorScheme.colors.base05}";
    bg = "#${config.colorScheme.colors.base00}";
    suffix.fg = "#${config.colorScheme.colors.base07}";
  };

  messages = {
    error.fg = "#${config.colorScheme.colors.base00}";
    error.bg = "#${config.colorScheme.colors.base08}";
    error.border = "#${config.colorScheme.colors.base08}";

    warning.fg = "#${config.colorScheme.colors.base00}";
    warning.bg = "#${config.colorScheme.colors.base0E}";
    warning.border = "#${config.colorScheme.colors.base0E}";

    info.fg = "#${config.colorScheme.colors.base05}";
    info.bg = "#${config.colorScheme.colors.base00}";
    info.border = "#${config.colorScheme.colors.base00}";
  };

  prompts = {
    fg = "#${config.colorScheme.colors.base05}";
    bg = "#${config.colorScheme.colors.base03}";
    border = "#${config.colorScheme.colors.base01}";
    selected.bg = "#${config.colorScheme.colors.base02}";
  };

  statusbar = {
    normal = {
      fg = "#${config.colorscheme.colors.base05}";
      bg = "#${config.colorScheme.colors.base00}";
    };

    insert = {
      fg = "#${config.colorScheme.colors.base00}";
      bg = "#${config.colorScheme.colors.base0C}";
    };

    passthrough = {
      fg = "#${config.colorScheme.colors.base05}";
      bg = "#${config.colorScheme.colors.base0D}";
    };

    private = {
      fg = "#${config.colorScheme.colors.base0E}";
      bg = "#${config.colorScheme.colors.base00}";
    };

    command = {
      fg = "#${config.colorScheme.colors.base05}";
      bg = "#${config.colorScheme.colors.base01}";

      private.fg = "#${config.colorScheme.colors.base0E}";
      private.bg = "#${config.colorScheme.colors.base01}";
    };

    caret = {
      fg = "#${config.colorScheme.colors.base00}";
      bg = "#${config.colorScheme.colors.base0E}";

      selection.fg = "#${config.colorScheme.colors.base00}";
      selection.bg = "#${config.colorScheme.colors.base0E}";
    };

    progress = {
      bg = "#${config.colorScheme.colors.base0C}";
    };

    url = {
      fg = "#${config.colorScheme.colors.base07}";

      error.fg = "#${config.colorScheme.colors.base08}";
      hover.fg = "#${config.colorScheme.colors.base09}";
      success.http.fg = "#${config.colorScheme.colors.base00}";
      warn.fg = "#${config.colorScheme.colors.base0E}";
    };
  };

    tabs = {
      bar.bg = "#${config.colorScheme.colors.base00}";

      indicator.start = "#${config.colorScheme.colors.base0C}";
      indicator.stop = "#${config.colorScheme.colors.base0D}";
      indicator.error = "#${config.colorScheme.colors.base08}";

      odd.fg = "#${config.colorScheme.colors.base05}";
      odd.bg = "#${config.colorScheme.colors.base02}";
      even.fg = "#${config.colorScheme.colors.base05}";
      even.bg = "#${config.colorScheme.colors.base03}";


      selected.odd.fg = "#${config.colorScheme.colors.base02}";
      selected.odd.bg = "#${config.colorScheme.colors.base04}";
      selected.even.fg = "#${config.colorScheme.colors.base02}";
      selected.even.bg = "#${config.colorScheme.colors.base04}";

      pinned.selected.odd.fg = "#${config.colorScheme.colors.base02}";
      pinned.selected.odd.bg = "#${config.colorScheme.colors.base0B}";
      pinned.selected.even.fg = "#${config.colorScheme.colors.base02}";
      pinned.selected.even.bg = "#${config.colorScheme.colors.base0B}";
    };


  webpage.bg = "#${config.colorScheme.colors.base03}";
}
