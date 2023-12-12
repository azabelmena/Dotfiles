{ pkgs, config, ... }:
{

  enable = true;

  theme = "Gruvbox Dark Soft";

  font = {
          name = "BlexMono Nerd Font Mono";
          size = 12;
  };

  keybindings = {
      "ctrl+shift+l" = "next_tab";
      "ctrl+shift+h" = "previous_tab";

      "ctrl+shift+delete" = "clear_terminal reset active";
      "ctrl+shift+f" = "toggle_fullscreen";
      "ctrl+shift+t" = "no_op";
  };

  settings = {
      enable_audio_bell = "no";
      remember_window_size = "yes";
      confirm_os_window_close = "0";
  };
}
