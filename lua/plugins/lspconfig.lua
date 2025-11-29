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

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
          },
        },
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "standard",
            },
          },
        },
      })

      -- vim.lsp.config("ts_ls", {
      --   settings = {
      --     typescript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all", -- "none" | "literals" | "all"
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --     },
      --     javascript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all",
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --     },
      --   },
      -- })

      vim.lsp.config("vtsls", {
        settings = {
          vtsls = {
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
          typescript = {
            inlayHints = {
              parameterNames = {
                enabled = "all", -- "none" | "literals" | "all"
              },
              variableTypes = {
                enabled = true,
                suppressWhenTypeMatchesName = false,
              },
            },
          },

          javascript = {
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
              variableTypes = {
                enabled = true,
                suppressWhenTypeMatchesName = false,
              },
            },
          },
        },
      })

      mason_lspconfig.setup({
        -- handlers = {
        -- 	function(server_name)
        -- 		print(server_name)
        -- 		local server = servers[server_name] or {}
        -- 		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        -- 		lspconfig[server_name].setup(server)
        -- 	end,
        -- },
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
    end,
  },
}
