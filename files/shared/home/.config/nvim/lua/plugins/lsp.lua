return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "folke/lazydev.nvim",
    },

    config = function()
      require("lazydev").setup({})

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Shared capabilities for completion integration.
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- C and C++
      vim.lsp.config("clangd", {})

      -- Python
      vim.lsp.config("pyright", {})

      -- Rust
      vim.lsp.config("rust_analyzer", {})

      -- LaTeX
      vim.lsp.config("texlab", {})

      vim.lsp.enable({
        "lua_ls",
        "clangd",
        "pyright",
        "rust_analyzer",
        "texlab",
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },

    init = function()
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        callback = 1,
      }
    end,
  },
}

