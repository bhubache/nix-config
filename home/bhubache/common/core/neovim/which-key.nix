{pkgs, ...}: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    window.border = "rounded";
  };
}
