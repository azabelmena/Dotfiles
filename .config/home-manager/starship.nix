{ pkgs, config, ... }:
{

  enable = true;
  enableBashIntegration = true;
  enableZshIntegration = true;

  package = pkgs.starship;

  settings = {
    add_newline = false;

    line_break = false;

    format =
      "$username$hostname$directory$git_branch$git_status$git_commit$cmd_duration$nix_shell$shell$character";

    scan_timeout = 10;

    character = {
      success_symbol = "[>]( #${config.colorScheme.colors.base0B})";
      error_symbol = "[>]( #${config.colorScheme.colors.base08})";
      vimcmd_symbol = "[>]( #${config.colorScheme.colors.base0B})";
      vimcmd_visual_symbol = "[>]( #${config.colorScheme.colors.base0E})";
      vimcmd_replace_symbol = "[>]( #${config.colorScheme.colors.base0A})";
      vimcmd_replace_one_symbol = "[>]( #${config.colorScheme.colors.base0A})";
    };

    username = {
      style_user = " #${config.colorScheme.colors.base0D}";
      style_root = " #${config.colorScheme.colors.base08}";

      show_always = true;

      format = "[$user]($style)";
    };

    hostname = {
      ssh_only = false;
      style= " #${config.colorScheme.colors.base08}";
      format = "[@](#${config.colorScheme.colors.base0A})[$hostname]($style)[:](#${config.colorScheme.colors.base0A})";
    };

    directory = {
      truncation_length = 1;
      truncation_symbol = "../";

      style = " #${config.colorScheme.colors.base0D}";
      format = "[$path]($style)[$lock_symbol]($lock_style) ";
    };

    git_branch = {
      style = " #${config.colorScheme.colors.base0A}";
      format = "[$branch]($style) ";
    };

    git_status = {
      style = " #${config.colorScheme.colors.base08}";
      ahead = "[⇡]($style)";
      diverged = "[⇕]($style)";
      behind = "[⇣]($style)";
      modified = "[!]($style)";
      staged = "[+]($style)";
      deleted = "[✘]($style)";
    };

    shell = {
      bash_indicator = "bash";
      zsh_indicator = "zsh";
      fish_indicator = "fish";
      powershell_indicator = "❯_";
      disabled = false;
      format = "[$indicator]( #${config.colorScheme.colors.base08})";
    };

    nix_shell = {
      style = " #${config.colorScheme.colors.base0C}";
      symbol = "";
      impure_msg = "(impure)";
      pure_msg = "(pure)";
      disabled = false;
      heuristic = false;
    };

  };

}
