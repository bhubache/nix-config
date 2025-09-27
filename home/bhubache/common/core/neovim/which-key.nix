{pkgs, ...}: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings.win.border = "rounded";
  };
}
