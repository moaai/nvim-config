return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          icons = {
            package_installed = "i",
            package_pending = "p",
            package_uninstalled = "u",
          },
        },
      })
    end,
  },
}
