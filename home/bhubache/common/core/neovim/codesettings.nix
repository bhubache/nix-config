{pkgs, ...}: {
  programs.nixvim.plugins.codesettings = {
    enable = true;
    settings = {
      loader_extensions = [
        "codesettings.extensions.vscode"
        "codesettings.extensions.env"
      ];
    };
  };
}
