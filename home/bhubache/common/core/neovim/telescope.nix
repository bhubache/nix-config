{pkgs, ...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>sg" = {
        action = "live_grep";
	options = {
	  desc = "Grep (root dir)";
	};
      };
      "<leader>sf" = {
        action = "find_files";
	options = {
	  desc = "Find project files";
	};
      };
      "<leader>sb" = {
        action = "buffers";
	options = {
	  desc = "Find file among buffers";
	};
      };
      # TODO: Search all buffers
    };

    extensions.fzf-native = { enable = true; };
  };
}
