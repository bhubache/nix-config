{pkgs, ...}: {
  programs.nixvim.plugins.dashboard = {
    enable = true;
    settings = {
      theme = "doom";
      config = {
        header = [
	  ""
	  ""
	  ""
	  ""
	  ""
	  ""
	  ""
	  ""
          "     ██████╗ ██████╗ ██████╗ ███████╗"
          "    ██╔════╝██╔═══██╗██╔══██╗██╔════╝"
          "    ██║     ██║   ██║██║  ██║█████╗  "
          "    ██║     ██║   ██║██║  ██║██╔══╝  "
          "    ╚██████╗╚██████╔╝██████╔╝███████╗"
          "     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝"
         ""
         ""
	 ""
        ];
	center = [
	  {
	    action = "Telescope find_files cwd=";
	    desc = "Find File                                    ";
	    # desc_hl = "String";
	    icon = "  ";
	    # icon_hl = "Title";
	    key = "f";
	    key_format = "%s";
	    # key_hl = "Number";
	  }
	  {
	    action = ":ene <BAR> startinsert <CR>";
	    desc = "New File                                     ";
	    # desc_hl = "String";
	    icon = "  ";
	    # icon_hl = "Title";
	    key = "n";
	    key_format = "%s";
	    # key_hl = "Number";
	  }
	  {
	    action = "Telescope live_grep";
	    desc = "Find Text                                    ";
	    # desc_hl = "String";
	    icon = "  ";
	    # icon_hl = "Title";
	    key = "g";
	    key_format = "%s";
	    # key_hl = "Number";
	  }
	  {
	    action = ":qa";
	    desc = "Quit                                         ";
	    # desc_hl = "String";
	    icon = "  ";
	    # icon_hl = "Title";
	    key = "q";
	    key_format = "%s";
	    # key_hl = "Number";
	  }
	];
      };
    };
  };
}
