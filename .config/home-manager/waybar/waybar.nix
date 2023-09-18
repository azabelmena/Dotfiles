{ pkgs, ... }:
{
  enable = true;
  settings = {
    bar = {
      layer = "top";
      modules-left = ["custom/launcher" "cpu" "memory" "temperature"];
      modules-center = ["clock"];
      modules-right = ["pulseaudio" "custom/power"];

      "pulseaudio" = {
        tooltip = false;
        scroll-step = 5;
        format = "{icon} {volume}%";
        format-muted = "󰝟 ";
        format-icons = {
          default = ["" " " " "];
        };
      };

      "backlight" = {
        tooltip = false;
        format = " {}%";
        interval = 1;
      };

      "battery" = {
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon}  {capacity}%";
        format-charging = "  {capacity}%";
        format-plugged = "  {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = [" " " " " " " " " "];
      };

      "tray" = {
        icon-size = 18;
        spacing = 10;
      };

      "clock" = {
        format = "{:  %I:%M %p    %d/%m/%Y}";
      };

      "cpu" = {
        interval = 15;
        format = "  {}% ";
        max-length = 10;
      };

      "memory" = {
        interval = 30;
        format = "  {}% ";
        max-length = 10;
      };

      "temperature" = {
          "hwmon-path" = "/sys/class/hwmon/hwmon3/temp1_input";
          "critical-threshold" = 90;
          "interval" = 1;
          "format" = "󰔏 {temperatureC}°C ";
          "tooltip" = false;
      };

      "custom/launcher" = {
        format = " ";
      };
    };
  };
}
