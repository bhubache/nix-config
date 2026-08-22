{pkgs, lib, nixpkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.obsidian = {
    enable = true;

    vaults.Everything = {
      enable = true;
      target = "obsidian/Everything";
      settings = {
        appearance = {
          interfaceFontFamily = "JetBrainsMono Nerd Font";
          monospaceFontFamily = "JetBrainsMono Nerd Font";
        };

        communityPlugins = with pkgs.obsidianPlugins; [
          codeblock-customizer
        ];
      };
    };
  };
}
