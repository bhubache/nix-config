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
	    icon = "  ";
	    key = "f";
	    key_format = "%s";
	  }
	  {
	    action = ":ene <BAR> startinsert <CR>";
	    desc = "New File                                     ";
	    icon = "  ";
	    key = "n";
	    key_format = "%s";
	  }
	  {
	    action = "Telescope live_grep";
	    desc = "Find Text                                    ";
	    icon = "  ";
	    key = "g";
	    key_format = "%s";
	  }
	  {
	    action = ":qa";
	    desc = "Quit                                         ";
	    icon = "  ";
	    key = "q";
	    key_format = "%s";
	  }
	];
	footer = [""];
      };
    };
  };
}
