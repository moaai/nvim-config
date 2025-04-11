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


      -- lspconfig["pyright"].setup({
      -- 	capabilities = capabilities,
      -- 	settings = {
      -- 		pyright = {
      -- 			disableOrganizeImports = true, -- Using Ruff
      -- 		},
      -- 		python = {
      -- 			analysis = {
      -- 				ignore = { "*" }, -- Using Ruff
      -- 				-- typeCheckingMode = "off", -- Using mypy
      -- 			},
      -- 		},
      -- 	},
      -- })

      -- lspconfig["ruff"].setup({
      -- 	capabilities = capabilities,
      -- })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
        -- ["ruff"] = function()
        -- 	lspconfig["ruff"].setup({
        -- 		capabilities = capabilities,
        -- 	})
        -- end,
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
          numhl = "",
        })
      end

      -- sign({ name = "DiagnosticSignError", text = "E" })
      -- sign({ name = "DiagnosticSignWarn", text = "W" })
      -- sign({ name = "DiagnosticSignHint", text = "H" })
      -- sign({ name = "DiagnosticSignInfo", text = "I" })

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
