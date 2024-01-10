{ config, ... }:
{
  font = "Lat2-Terminus16";
  keyMap = "us";
  useXkbConfig = true;
  colors = [
    "${config.colorScheme.colors.base00}"
    "${config.colorScheme.colors.base01}"
    "${config.colorScheme.colors.base0B}"
    "${config.colorScheme.colors.base0B}"
    "${config.colorScheme.colors.base0E}"
    "${config.colorScheme.colors.base0F}"
    "${config.colorScheme.colors.base0D}"
    "${config.colorScheme.colors.base0D}"
    "${config.colorScheme.colors.base08}"
    "${config.colorScheme.colors.base08}"
    "${config.colorScheme.colors.base0B}"
    "${config.colorScheme.colors.base0A}"
    "${config.colorScheme.colors.base0C}"
    "${config.colorScheme.colors.base0C}"
    "${config.colorScheme.colors.base06}"
    "${config.colorScheme.colors.base07}"
  ];
}
