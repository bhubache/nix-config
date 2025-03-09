{pkgs, lib, ...}: {
  home.shellAliases = { "lg" = "lazygit"; };
  programs.lazygit = {
    enable = true;
  };
}
