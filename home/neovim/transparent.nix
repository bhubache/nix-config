{pkgs, ...}: {
  programs.nixvim.plugins.transparent = {
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
        
        "Pmenu"
        "CmpItemAbbr"
      ];
    };
  };
}
