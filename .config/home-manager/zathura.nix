{ pkgs, config, ... }:
{
  package = pkgs.zathura;
  enable = true;

  mappings = {
    "[normal] u"      = "scroll half-up";
    "[normal] d"      = "scroll half-down";
    "[normal] r"      = "reload";
    "[normal] i"      = "recolor";
    "[normal] p"      = "print";
    "[normal] Space"  = "navigate next";
  };
 options = {
    guioptions = "none";

    completion-group-bg = "#${config.colorScheme.colors.base00}";
    completion-group-fg = "#${config.colorScheme.colors.base00}";

    completion-bg = "#${config.colorScheme.colors.base00}";
    completion-fg = "#${config.colorScheme.colors.base06}";

    completion-highlight-bg = "#${config.colorScheme.colors.base09}";
    completion-highlight-fg = "#${config.colorScheme.colors.base03}";

    statusbar-h-padding = 0;
    statusbar-v-padding = 0;

    notification-error-bg = "#${config.colorScheme.colors.base08}";
    notification-error-fg = "#${config.colorScheme.colors.base03}";
    notification-warning-bg = "#${config.colorScheme.colors.base0A}";
    notification-warning-fg = "#${config.colorScheme.colors.base00}";
    notification-bg = "#${config.colorScheme.colors.base0B}";
    notification-fg = "#${config.colorScheme.colors.base00}";

    index-bg = "#${config.colorScheme.colors.base00}";
    index-fg = "#${config.colorScheme.colors.base06}";
    index-active-bg = "#${config.colorScheme.colors.base09}";
    index-active-fg = "#${config.colorScheme.colors.base03}";

    inputbar-bg = "#${config.colorScheme.colors.base09}";
    inputbar-fg = "#${config.colorScheme.colors.base00}";

    statusbar-bg = "#${config.colorScheme.colors.base00}";
    statusbar-fg = "#${config.colorScheme.colors.base06}";

    highlight-color = "#${config.colorScheme.colors.base09}";
    highlight-active-color = "#${config.colorScheme.colors.base03}";

    default-bg = "#${config.colorScheme.colors.base00}";
    default-fg = "#${config.colorScheme.colors.base06}";

    recolor-lightcolor = "#${config.colorScheme.colors.base00}";
    recolor-darkcolor  = "#${config.colorScheme.colors.base06}";
    recolor-keephue = true;
    recolor-reverse-video = true;

    page-padding = 1;
    recolor = true;
    selection-clipboard = "clipboard";
  };
}
