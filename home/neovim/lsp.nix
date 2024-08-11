{pkgs, ...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        ruff.enable = true;
	pyright.enable = true;
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
