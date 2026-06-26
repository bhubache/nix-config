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

    cornelis = {
      enable = true;
    };
  };

  programs.nixvim.extraConfigLua = ''
    vim.lsp.config['rust_analyzer'] = {
      cmd = { "rust-analyzer" },
    }
    vim.lsp.enable('rust_analyzer')
  '';

}
