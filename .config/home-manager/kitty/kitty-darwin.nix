{ pkgs, ... }:
{
    enable = true;

    theme = "Gruvbox Dark Soft";

    font = {
            name = "BlexMono Nerd Font Mono";
            size = 16;
    };

    keybindings = {
        "ctrl+shift+l" = "next_tab";
        "ctrl+shift+h" = "previous_tab";

        "ctrl+shift+delete" = "clear_terminal reset active";
        "ctrl+shift+f" = "toggle_fullscreen";
    };

    settings = {
        enable_audio_bell = "no";
        remember_window_size = "yes";
        confirm_os_window_close = "0";
        macos_quit_when_last_window_closed = "yes";

        active_tab_background = "#32302f";
        active_tab_foreground = "#d4be98";
        active_tab_font_style = "bold";
        inactive_tab_background = "#32302f";
        inactive_tab_foreground = "#a89984";
        inactive_tab_font_style = "normal";

    };
    #extraConfig = "macos_quit_when_last_window_closed = yes";
}
