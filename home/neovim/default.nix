{pkgs, ...}: {
  imports = [
    ./telescope.nix
    ./which-key.nix
    ./options.nix
    ./noice.nix
    ./auto-pairs.nix
    ./lsp.nix
    ./dashboard.nix
    ./transparent.nix
  ];

  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;

    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lua"; }
          { name = "nvim_lsp"; }
          { name = "cmdline"; }
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
	formatting.fields = [
	  "abbr"
	  "kind"
	  "menu"
	];
      };
    };
  };
}
