{ pkgs, ... }: {

  let
    yabai = "/run/current-system/sw/bin/yabai";
  in
  home.file.skhd = {
    target = ".config/skhd/skhdrc";

    text = ''

        cmd - return      : '/Applications/Nix Apps/kitty.app/Contents/MacOS'/kitty --hold sh -c 'cd'
        cmd - b           : /Applications/qutebrowser.app/Contents/MacOS/qutebrowser
        cmd - z           : /run/current-system/sw/bin/zathura

        # focus window
        cmd - h : yabai -m window --focus west
        cmd - j : yabai -m window --focus south
        cmd - k : yabai -m window --focus north
        cmd - l : yabai -m window --focus east

        cmd - tab : if [ "$(yabai -m query --spaces --space | jq -r '.type')" = "bsp" ]; then yabai -m window --focus bsp.prev || yabai -m window --focus bsp.last; else yabai -m window --focus north; fi

        # swap managed window
        shift + cmd - h : yabai -m window --swap west
        shift + cmd - j : yabai -m window --swap south
        shift + cmd - k : yabai -m window --swap north
        shift + cmd - l : yabai -m window --swap east

        # toggle layout
        cmd - d : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "bsp" else "bsp" end')
      '';
  };
}
