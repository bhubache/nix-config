{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        servers = {
          ruff.enable = true;
          basedpyright.enable = true;
          hls = {
            enable = true;
            installGhc = true;
          };
        };

        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
      };

      cornelis = {
        enable = true;
      };
    };


    extraConfigLua = ''
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
          vim.lsp.buf.format({ async = false})
        end,
      })

      -- Allow virtual text for inlay hints
      vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
    '';
  };

}
