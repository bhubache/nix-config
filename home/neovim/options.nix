{pkgs, ...}: {
  programs.nixvim.opts = {
    updatetime = 250;
    # Time in milliseconds to wait for a mapped sequence to complete
    timeoutlen = 300;
    hlsearch = false;           # Set highlight on search
    number = true;              # Make line numbers default
    mouse = "a";                # Enable mouse mode
    clipboard = "unnamedplus";  # Sync clipboard between OS and neovim
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    termguicolors = true;
    completeopt = "menuone,noselect";

    autoindent = true;
    expandtab = true;  # Pressing tab will insert spaces instead of a tab character
    tabstop = 4;       # Make tab look like 4 spaces
    softtabstop = 4;   # Number of spaces inserted instead of a tab character
    shiftwidth = 4;    # Number of sapces inserted when indenting
  };
}
