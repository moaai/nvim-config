return {
  {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      { "saghen/blink.cmp", { "j-hui/fidget.nvim", opts = {} } },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local blink_nvim_lsp = require("blink.cmp")

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = blink_nvim_lsp.get_lsp_capabilities(original_capabilities)

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      }

      mason_lspconfig.setup({
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          lspconfig[server_name].setup(server)
        end,
      })

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
        -- signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        -- float = {
        --   border = 'rounded',
        --   source = 'always',
        --   header = '',
        --   prefix = '',
        -- },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, {})
      keymap.set("n", "<leader>fh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggles inline hints" })
    end,
  },
}
