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
  ];

  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;
  };
}
