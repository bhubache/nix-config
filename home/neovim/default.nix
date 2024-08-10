{pkgs, ...}: {
  imports = [
    ./telescope.nix
    ./which-key.nix
    ./options.nix
    ./noice.nix
    ./auto-pairs.nix
    ./lsp.nix
    ./dashboard.nix
  ];

  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;

    plugins.transparent = {
      enable = true;
      settings = {
        extra_groups = [
          "NormalFloat"

	  "TelescopePromptTitle"
	  "TelescopePromptPrefix"
	  "TelescopePromptCounter"
	  "TelescopePromptNormal"
	  "TelescopePromptBorder"

	  "TelescopeResultsTitle"
	  "TelescopeResultsNormal"
	  "TelescopeResultsBorder"

	  "TelescopePreviewTitle"
	  "TelescopePreviewNormal"
	  "TelescopePreviewBorder"
        ];
      };
    };
  };
}
