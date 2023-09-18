{ pkgs, ... }:
{
  enable = true;

  mappings = {
    "u" =  "scroll half-up";
    "d" = "scroll half-down";
    "r"  = "reload";
    "R"  = "rotate";
    "i" = "recolor";
    "p" = "print";
  };

  options = {
    completion-group-bg = "#282828";
    completion-group-fg = "#ebdbb2";
    completion-bg = "#282828";
    completion-fg = "#ebdbb2";
    completion-highlight-bg = "#458588";
    completion-highlight-fg = "#ebdbb2";

    statusbar-h-padding = 0;
    statusbar-v-padding = 0;

    notification-error-bg = "#3c3836";
    notification-error-fg = "#ebdbb2";
    notification-warning-bg = "#3c3836";
    notification-warning-fg = "#ebdbb2";
    notification-bg = "#3c3836";
    notification-fg = "#ebdbb2";

    index-bg = "#1d2021";
    index-fg = "#ebdbb2";
    index-active-bg = "#282828";
    index-active-fg = "#ebdbb2";

    inputbar-bg = "#3c3836";
    inputbar-fg = "#ebdbb2";

    statusbar-bg = "#282828";
    statusbar-fg = "#ebdbb2";

    highlight-color = "#458588";
    highlight-active-color = "#458588";

    default-bg = "#1d2021";
    default-fg = "#001512";
    recolor-lightcolor = "#282828";
    recolor-darkcolor  = "#d4be98";

    page-padding = 1;
    recolor = true;
    selection-clipboard = "clipboard";
  };
}
