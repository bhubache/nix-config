{pkgs, pkgsUnstable, configLib, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      cursor-style-blink = false;
      cursor-color = "#ABB2BF";
      shell-integration-features = "no-cursor";
      background-opacity = 0.8;
      font-feature = "-calt";  # Disable ligatures
      # custom-shader = builtins.toString (configLib.relativeToRoot "home/bhubache/common/core/ghostty/shaders/cursor_blaze.glsl");
      # custom-shader = builtins.toString (configLib.relativeToRoot "home/bhubache/common/core/ghostty/shaders/cursor_blaze_tapered.glsl");
      # custom-shader = builtins.toString (configLib.relativeToRoot "home/bhubache/common/core/ghostty/shaders/custom_tapered.glsl");
      custom-shader = builtins.toString (configLib.relativeToRoot "home/bhubache/common/core/ghostty/shaders/custom_smear.glsl");
    };
  };

  nixpkgs.overlays = [
    (self: super: {
      ghostty = pkgsUnstable.ghostty;
    })
  ];
}
