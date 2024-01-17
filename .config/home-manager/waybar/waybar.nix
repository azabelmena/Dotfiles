{ pkgs, ... }:
{

  package = pkgs.waybar;

  enable = true;
  settings = {
    bar = {
      layer = "top";
      modules-left = ["custom/logo" "disk" "cpu" "memory" "temperature"];
      modules-center = ["clock"];
      modules-right = [ "hyprland/workspaces" "pulseaudio" "battery" "network"];

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
        format-charging = "󱐋 {capacity}%";
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

      "network"= {
          "format"= "{ifname}";
          "format-wifi"= "  {essid} ({signalStrength}%)";
          "format-ethernet"= "󰈁 {ipaddr}/{cidr}";
          "format-disconnected"= "";
          "tooltip-format"= "󰈁 {ifname} via {gwaddr}";
          "tooltip-format-wifi"= "  {essid} ({signalStrength}%)";
          "tooltip-format-ethernet"= "{ifname} ";
          "tooltip-format-disconnected"= "";
          "max-length"= 50;
      };

      "bluetooth"= {
          "controller"= "controller1";
          "format"= "  ";
          "format-disabled"= " 󰂲 ";
          "format-connected"= " {num_connections} connected";
          "tooltip-format"= "{controller_alias}\t{controller_address}";
          "tooltip-format-connected"=
              "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected"= "{device_alias}\t{device_address}";
      };

      "disk"= {
          "interval"= 60;
          "format"= "󰋊 {percentage_free}% ";
          "path"= "/";
      };

      "cpu" = {
        interval = 1;
        format = " 󰻠 {}% ";
        max-length = 10;
      };

      "memory" = {
        interval = 1;
        format = "   {}% ";
        max-length = 10;
      };

      "temperature" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 90;
          interval = 1;
          format = "󰔏 {temperatureC}°C ";
          tooltip = false;
      };

      "custom/logo" = {
        format = "      ";
      };
    };
  };
}
