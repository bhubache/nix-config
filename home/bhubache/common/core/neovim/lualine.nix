{pkgs, ...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;

    # FIXME: This is here because it seems that stylix isn't properly
    # 	     configuring the theme.
    settings.options.theme = "onedark";
  };
}
