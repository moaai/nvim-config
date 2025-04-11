return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/lazydev.nvim", opts = {} },
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
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
