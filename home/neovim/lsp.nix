{pkgs, ...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        pylsp.enable = true;
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
