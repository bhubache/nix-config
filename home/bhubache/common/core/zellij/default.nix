{pkgs, lib, ...}:
{
  home.shellAliases = { "zj" = "zellij"; };
  programs.zellij = {
    enable = true;
  };

  # Configuring zellij via ``programs.zellij.settings`` is a pain as it doesn't
  # support KDL so I've chosen to do this instead.
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
