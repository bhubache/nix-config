{pkgs, ...}: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      notifier = {
        enabled = true;
      };
      input = {
        enabled = true;
      };
      picker = {
        enabled = true;
      };
    };
  };
}
