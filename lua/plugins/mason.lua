return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
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
        }
      })
    end,
  },
}
