{pkgs, ...}: {
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
      custom-shader = "./shaders/cursor_blaze.glsl";
    };
  };
}
