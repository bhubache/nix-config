{pkgs, ...}: {
  imports = [
    ./snacks.nix
    ./telescope.nix
    ./treesitter.nix
    ./web-devicons.nix
    ./which-key.nix
    ./options.nix
    ./noice.nix
    ./auto-pairs.nix
    ./lsp.nix
    ./dashboard.nix
    ./transparent.nix
    ./cmp.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    enable = true;
    defaultEditor = true;

    keymaps = [
      {
        action = "<Esc><Esc>";
        key = "<Esc>";
      }
    ];

    # Navigation on colemak
    # keymaps = [
    #   {
    #     action = "<cmd>wincmd i<CR>";
    #     key = "<C-i>";
    #   }
    #   {
    #     action = "<cmd>wincmd m<CR>";
    #     key = "<C-m>";
    #   }
    #   {
    #     action = "<cmd>wincmd n<CR>";
    #     key = "<C-n>";
    #   }
    #   {
    #     action = "<cmd>wincmd e<CR>";
    #     key = "<C-e>";
    #   }
    #   {
    #     action = "h";
    #     key = "m";
    #   }
    #   {
    #     action = "j";
    #     key = "n";
    #   }
    #   {
    #     action = "k";
    #     key = "e";
    #   }
    #   {
    #     action = "l";
    #     key = "i";
    #   }
    #   {
    #     action = "i";
    #     key = "h";
    #   }
    # ];
  };
}
