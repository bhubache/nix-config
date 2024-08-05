{pkgs, ...}: {
  imports = [
    ./telescope.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    colorschemes.onedark.enable = true;

    globals.mapleader = " ";

    enable = true;
    defaultEditor = true;
  };
}
