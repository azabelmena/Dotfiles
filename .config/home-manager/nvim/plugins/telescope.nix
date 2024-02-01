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
   "<leader>ff" = {
     action = "find_files";
     desc = "Fuzzy find recent files";
   };
   "<leader>fr" = {
     action = "oldfiles";
     desc = "Fuzzy find recent files";
   };
   "<leader>fs" = {
     action = "live_grep";
     desc = "Find string";
   };
   "<leader>fc" = {
     action = "grep_string";
     desc = "Find string under cursor";
   };
   "<leader>fh" = {
     action = "help_tags";
     desc = "Find help tags";
   };
   "<leader>fb" = {
     action = "buffers";
     desc = "Find buffers";
   };
  };

}
