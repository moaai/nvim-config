return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/neodev.nvim",                   opts = {}, },
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- lspconfig.lua_ls.setup {}
      -- lspconfig.ts_ls.setup {}
      --
      -- lspconfig.clangd.setup {}
      -- lspconfig.pyright.setup {}

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
        -- custom setup ...
        -- ["clangs"] = function()
        --   lspconfig["clangd"].setup({
        --     capabilities = capabilities,
        --     on_attach = function(client, bufnr)
        --     end,
        --   })
        -- end,
      })

      -- Move to options ???

      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({ name = 'DiagnosticSignError', text = 'E' })
      sign({ name = 'DiagnosticSignWarn', text = 'W' })
      sign({ name = 'DiagnosticSignHint', text = 'H' })
      sign({ name = 'DiagnosticSignInfo', text = 'I' })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
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
    end,
  },
}
