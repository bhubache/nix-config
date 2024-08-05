{pkgs, ...}: {
  imports = [
    ./telescope.nix
    ./which-key.nix
    ./options.nix
    ./noice.nix
    ./auto-pairs.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    colorschemes.onedark.enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;
  };
}
