{pkgs, lib, nixpkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.obsidian = {
    enable = true;

    vaults.Everything = {
      enable = true;
      target = "obsidian/Everything";
      settings = {
        communityPlugins = with pkgs.obsidianPlugins; [
          codeblock-customizer
        ];
      };
    };
  };
}
