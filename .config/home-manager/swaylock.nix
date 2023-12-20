{ pkgs, config, ... }:
{

  enable = true;

  settings = {
    font-size = 24;
    image = "~/Pictures/Wallpapers/gruvbox-dark-lockscreen-scalable.png";
    indicator-caps-lock = false;
    indicator-idle-visible = false;
    indicator-radius = 100;
    line-color = "#${config.colorScheme.colors.base00}";
    show-failed-attempts = false;

    ring-clear-color = "#${config.colorScheme.colors.base09}";
    ring-color = "#${config.colorScheme.colors.base08}";
    ring-ver-color = "#${config.colorScheme.colors.base0A}";
    ring-wrong-color = "#${config.colorScheme.colors.base0B}";

    inside-clear-color = "#${config.colorScheme.colors.base0E}";
    inside-color = "#${config.colorScheme.colors.base0B}";
    inside-ver-color = "#${config.colorScheme.colors.base0D}";
    inside-wrong-color = "#${config.colorScheme.colors.base08}";

    key-hl-color = "#${config.colorScheme.colors.base09}";

  };

}
