return {
  "nvim-tree/nvim-tree.lua",
  depenedencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup({
      -- on_attach = on_attach,
      sort_by = "case_sensitive",
      view = {
        width = 30,
        -- mappings = {
        --   list = {
        --     { key = "u", action = "dir_up" },
        --   },
        -- },
      },
      renderer = {
        group_empty = true,
        icons = {
          webdev_colors = true,
        }
      },
      filters = {
        dotfiles = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {}
      }
    })
  end,
}
