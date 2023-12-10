{ config, pkgs, lib, ... }: {
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      # bar configuration
      yabai -m config   external_bar all:0:45
      yabai -m signal --add event=window_focused   action="sketchybar --trigger window_focus"
      yabai -m signal --add event=window_created   action="sketchybar --trigger windows_on_spaces"
      yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"

      # layout
      yabai -m config layout bsp
      yabai -m config auto_balance on

      yabai -m config mouse_modifier alt
      # set modifier + right-click drag to resize window (default: resize)
      yabai -m config mouse_action2 resize
      # set modifier + left-click drag to resize window (default: move)
      yabai -m config mouse_action1 move

      # gaps
      yabai -m config top_padding    15
      yabai -m config bottom_padding 15
      yabai -m config left_padding   15
      yabai -m config right_padding  15
      yabai -m config window_gap     15

      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      # workspace management
      yabai -m space 1  --label todo
      yabai -m space 2  --label productive
      yabai -m space 3  --label chat
      yabai -m space 4  --label utils
      yabai -m space 5  --label code

      # assign apps to spaces
      yabai -m rule --add app="Reminder" space=todo

      yabai -m rule --add app="Messages" space=chat

      yabai -m rule --add app="Spotify" space=utils

      borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=10.0 2>/dev/null 1>&2 &
      echo "borders started or updated"
    '';
  };
}
