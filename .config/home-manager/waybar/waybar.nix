{ pkgs, ... }:
{
  enable = true;
  settings = {
    bar = {
      layer = "top";
      modules-left = ["custom/launcher" "disk" "cpu" "memory" "temperature"];
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
          interval = 1;
          format = "{:  %H:%M:%S}";
          tooltip-format= "<tt><small>{calendar}</small></tt>";
          calendar= {
              mode          = "month";
              mode-mon-col  = 3;
              weeks-pos     = "right";
              on-scroll     = 1;
              on-click-right= "mode";
              format= {
              months=     "<span color='#ffead3'><b>{}</b></span>";
              days=       "<span color='#ecc6d9'><b>{}</b></span>";
              weeks=      "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays=   "<span color='#ffcc66'><b>{}</b></span>";
              today=      "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
          };
      };

      "disk"= {
          "interval"= 30;
          "format"= "󰋊 {percentage_free}% ";
          "path"= "/";
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
          hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
          critical-threshol = 90;
          interval = 1;
          format = "󰔏 {temperatureC}°C ";
          tooltip = false;
      };

      "custom/launcher" = {
        format = "     ";
      };
    };
  };
}
