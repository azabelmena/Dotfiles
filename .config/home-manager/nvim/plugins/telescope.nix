{

  enable = true;

  highlightTheme = "gruvbox";

  extraOptions = {
    pickers ={
      find_files = {
        hidden = true;
      };

      man_pages = {
        sections = [ "ALL" ];
        man_cmd = [ "apropos" ".*" ];
      };
    };
  };

  keymaps = {
   "<localleader>ff" = {
     action = "find_files";
     desc = "Fuzzy find recent files";
   };
   "<localleader>fr" = {
     action = "oldfiles";
     desc = "Fuzzy find recent files";
   };
   "<localleader>fs" = {
     action = "live_grep";
     desc = "Find string";
   };
   "<localleader>fc" = {
     action = "grep_string";
     desc = "Find string under cursor";
   };
   "<localleader>fh" = {
     action = "help_tags";
     desc = "Find help tags";
   };
   "<localleader>fb" = {
     action = "buffers";
     desc = "Find buffers";
   };
  };

}
