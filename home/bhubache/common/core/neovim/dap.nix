{pkgs, ...}: let
  codelldb = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb";
in {
  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins.rustaceanvim];

    plugins = {
      dap = {
        enable = true;
      };

      dap-ui = {
        enable = true;
        settings = {
          layouts = [
            {
              elements = [
                { id = "scopes"; size = 0.6; }
                { id = "stacks"; size = 0.4; }
              ];
              position = "left";
              size = 40;
            }
            {
              elements = [
                { id = "console"; size = 1.0; }
              ];
              position = "bottom";
              size = 10;
            }
          ];
        };
      };

      dap-virtual-text = {
        enable = true;
      };
    };

    keymaps = [
      {
        action.__raw = "function() require('dap').continue() end";
        key = "<leader>dc";
        options.desc = "DAP Continue";
      }
      {
        action.__raw = "function() require('dap').step_over() end";
        key = "<leader>do";
        options.desc = "DAP Step Over";
      }
      {
        action.__raw = "function() require('dap').step_into() end";
        key = "<leader>di";
        options.desc = "DAP Step Into";
      }
      {
        action.__raw = "function() require('dap').step_out() end";
        key = "<leader>dO";
        options.desc = "DAP Step Out";
      }
      {
        action.__raw = "function() require('dap').toggle_breakpoint() end";
        key = "<leader>db";
        options.desc = "DAP Toggle Breakpoint";
      }
      {
        action.__raw = "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end";
        key = "<leader>dB";
        options.desc = "DAP Conditional Breakpoint";
      }
      {
        action.__raw = "function() require('dapui').toggle() end";
        key = "<leader>du";
        options.desc = "DAP UI Toggle";
      }
      {
        action.__raw = "function() require('dap').terminate() end";
        key = "<leader>dt";
        options.desc = "DAP Terminate";
      }
      {
        action = "<cmd>RustLsp debuggables<cr>";
        key = "<leader>dd";
        options.desc = "Rust Debuggables";
      }
      {
        action = "<cmd>RustLsp debug<cr>";
        key = "<leader>dr";
        options.desc = "Rust Debug (cursor)";
      }
    ];

    # Use rust-analyzer from nixpkgs if the environment doesn't provide one.
    extraPackagesAfter = [pkgs.rust-analyzer-unwrapped];

    extraConfigLua = ''
      vim.g.rustaceanvim = {
        server = {
          auto_attach = true,
          cmd = { "rust-analyzer" },
        },
        dap = {
          adapter = require('rustaceanvim.config').get_codelldb_adapter(
            "${codelldb}/adapter/codelldb",
            "${codelldb}/lldb/lib/liblldb.so"
          ),
        },
      }

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    '';
  };
}
