-- In your plugins.lua or wherever you configure Lazy
return {
  {
    "phaazon/hop.nvim",
    branch = "v2", -- recommended
    config = function()
      require("hop").setup()

      local hop = require("hop")
      -- local directions = require("hop.hint").HintDirection

      -- -- Single-character jump in current line
      -- vim.keymap.set("", "f", function()
      -- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      -- end)
      -- vim.keymap.set("", "F", function()
      -- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      -- end)
      --
    end,
  },
}
