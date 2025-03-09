{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      cursor-style-blink = false;
      background-opacity = 0.8;
      background-blur = 20;
      font-feature = "-calt";  # Disable ligatures
    };
  };
}
