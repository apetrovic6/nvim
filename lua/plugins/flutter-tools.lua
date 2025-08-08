return {
  -- 🔌 1. turn off the Mason bridge so it never loads
  -- { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  {
    "wa11breaker/flutter-bloc.nvim",
    dependencies = {
      "nvimtools/none-ls.nvim", -- Required for code actions
    },
    opts = {
      bloc_type = "equatable", -- Choose from: 'default', 'equatable', 'freezed'
      use_sealed_classes = false,
      enable_code_actions = true,
    },
    config = function(_, opts)
      require("flutter-bloc").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dart",
        callback = function()
          -- Create Bloc
          vim.keymap.set("n", "<Leader>cgb", "<cmd>lua require('flutter-bloc').create_bloc()<cr>", {
            desc = "[C]reate [F]lutter [B]loc",
            buffer = true,
          })

          -- Create Cubit
          vim.keymap.set("n", "<Leader>cgc", "<cmd>lua require('flutter-bloc').create_cubit()<cr>", {
            desc = "[C]reate [F]lutter [C]ubit",
            buffer = true,
          })
        end,
      })
    end,
  },

  -- 🔌 2. flutter-tools
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = {
      debugger = {
        enabled = true,
        run_via_dap = true,
      },
    },
  },

  -- 🔌 3. DAP configuration
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.dart = {
        type = "executable",
        command = "flutter",
        args = { "debug_adapter" },
      }

      dap.configurations.dart = {
        {
          name = "Flutter: Launch",
          type = "dart",
          request = "launch",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
          flutterMode = "debug",
          toolArgs = { "-d", "linux" },
        },
      }
    end,
  },
}
