{pkgs, inputs, ...}: {
  # TODO: Can this be moved to neovim/default.nix?
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      mapping = {
        "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        # Pull up menu
        "<C-k>" = "cmp.mapping.complete()";
        # Closes menu and deletes current selection if any
        "<Esc>" = "cmp.mapping.abort()";
      };
      completion.completeopt = "menu,menuone,noinsert";
      formatting.fields = [
        "abbr"
        "kind"
        "menu"
      ];
    };
  };
}
