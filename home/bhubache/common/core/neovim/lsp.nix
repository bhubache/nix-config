{pkgs, ...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        ruff.enable = true;
	basedpyright.enable = true;
	hls = {
	  enable = true;
	  installGhc = true;
	};
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
