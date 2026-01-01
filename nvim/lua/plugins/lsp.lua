return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local esp32 = require("esp32")
      opts.servers = opts.servers or {}
      opts.servers.clangd = esp32.lsp_config()
      return opts
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- LSP server configs
      vim.lsp.config("pyright", {})

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true,
            staticcheck = true,
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      -- Enable servers
      vim.lsp.enable({ "pyright", "clangd", "gopls" })

      -- Diagnostics
      vim.diagnostic.config({
        update_in_insert = true,

        virtual_text = {
          spacing = 4,
          prefix = "●",
        },
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          source = "always",
          border = "rounded",
        },
      })

      vim.o.updatetime = 250

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          local opts = {
            focusable = false,
            close_events = {
              "BufLeave",
              "CursorMoved",
              "InsertEnter",
              "FocusLost",
            },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }

          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      local conform = require("conform")

      conform.setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },

        formatters_by_ft = {
          cpp = { "clang-format" },
          c = { "clang-format" },
          python = { "black" },
          go = { "gofumpt" },
        },

        formatters = {
          ["clang-format"] = {
            prepend_args = { "--style=Google" },
          },
        },
      })
    end,
  },
}
