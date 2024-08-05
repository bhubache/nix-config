{pkgs, ...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>fg" = "live_grep";
    };

    extensions.fzf-native = { enable = true; };
  };
}
