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
    ./cmp.nix
    ./lualine.nix
    ./dap.nix
    ./codesettings.nix
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

      # Navigate between splits
      {
        action = "<C-w>h";
        key = "<C-h>";
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
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
