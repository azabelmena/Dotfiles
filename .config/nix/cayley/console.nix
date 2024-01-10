{ config, ... }:
{
  font = "Lat2-Terminus16";
  keyMap = "us";
  useXkbConfig = true;
  colors = [
    "${config.colorScheme.colors.base00}"
    "${config.colorScheme.colors.base01}"
    "${config.colorScheme.colors.base02}"
    "${config.colorScheme.colors.base03}"
    "${config.colorScheme.colors.base04}"
    "${config.colorScheme.colors.base05}"
    "${config.colorScheme.colors.base06}"
    "${config.colorScheme.colors.base07}"
    "${config.colorScheme.colors.base08}"
    "${config.colorScheme.colors.base09}"
    "${config.colorScheme.colors.base0A}"
    "${config.colorScheme.colors.base0B}"
    "${config.colorScheme.colors.base0C}"
    "${config.colorScheme.colors.base0D}"
    "${config.colorScheme.colors.base0E}"
    "${config.colorScheme.colors.base0F}"
  ];
}
