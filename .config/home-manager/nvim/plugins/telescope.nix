{

  enable = true;

  highlightTheme = "gruvbox";

  extraOptions = {
    pickers ={
      find_files = {
        hidden = true;
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
   "<localleader>fm" = {
     action = "man_pages";
     desc = "Find man pages";
   };
   "<localleader>fb" = {
     action = "buffers";
     desc = "Find buffers";
   };
  };

}
