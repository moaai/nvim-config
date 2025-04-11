return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer",
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- "joshdick/onedark.vim",
    "navarasu/onedark.nvim",
    "NLKNguyen/papercolor-theme",
    "morhetz/gruvbox",
    "dracula/vim",
    "catppuccin/nvim",
  },
}
