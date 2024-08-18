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
    ./cmp.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;

    keymaps = [
      {
        action = "<cmd>wincmd l<CR>";
	key = "<C-l>";
      }
      {
        action = "<cmd>wincmd h<CR>";
	key = "<C-h>";
      }
      {
        action = "<cmd>wincmd j<CR>";
	key = "<C-j>";
      }
      {
        action = "<cmd>wincmd k<CR>";
	key = "<C-k>";
      }
    ];
  };
}
