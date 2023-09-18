{ pkgs, ... }:
{
    enable = true;

    theme = "Gruvbox Dark Soft";

    font = {
            name = "";
            size = 12;
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

        active_tab_background = "#282828";
        active_tab_foreground = "#d4be98";
        active_tab_font_style = "bold";
        inactive_tab_background = "#282828";
        inactive_tab_foreground = "#a89984";
        inactive_tab_font_style = "normal";

    };
}
