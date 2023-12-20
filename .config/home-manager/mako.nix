{ pkgs, config, ... }:
{

  enable = true;
  actions = true;

  defaultTimeout = 5000;
  sort = "+time";
  maxVisible = 10;

  font = "BlexMono Nerd Font 12";
  icons = true;

  anchor = "top-right";
  layer = "overlay";
  margin = "10,,10,";

  padding = "5,5,5,5";

  backgroundColor = "#${config.colorScheme.colors.base00}";
  textColor = "#${config.colorScheme.colors.base06}";

  borderColor = "#${config.colorScheme.colors.base08}";
  borderRadius = 0;
  borderSize = 3;

  progressColor = "#${config.colorScheme.colors.base0B}";

  width = 200;
  height = 100;

}
