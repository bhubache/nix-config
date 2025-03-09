{pkgs, lib, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "onedark";
      base_10_sizes = true;
      temp_scale = "fahrenheit";
    };
  };
}
