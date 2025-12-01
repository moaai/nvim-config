return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      -- require("onedark").setup({
      -- 	style = "warmer",
      -- })
      -- vim.cmd("colorscheme onedark")
    end,
  },
  -- {
  --   "joshdick/onedark.vim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme onedark")
  --   end,
  -- },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer",
      })
      require("onedark").load()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- "joshdick/onedark.vim",
    "NLKNguyen/papercolor-theme",
    "morhetz/gruvbox",
    "dracula/vim",
    "catppuccin/nvim",
  },
}
