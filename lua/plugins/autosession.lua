return {
  {
    -- "rmagatti/auto-session",
    -- lazy = false,
    --
    -- config = function()
    --   local as = require("auto-session")
    --   as.setup({
    --     opts = {
    --       suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    --       -- log_level = 'debug',
    --     },
    --     session_lens = {
    --       load_on_setup = true, -- Initialize on startup (requires Telescope)
    --       theme_conf = { -- Pass through for Telescope theme options
    --         -- layout_config = { -- As one example, can change width/height of picker
    --         --   width = 0.8,    -- percent of window
    --         --   height = 0.5,
    --         -- },
    --       },
    --       previewer = false, -- File preview for session picker
    --     },
    --   })
    --
    --   local keymap = vim.keymap
    --   keymap.set(
    --     "n",
    --     "<leader>ls",
    --     require("auto-session.session-lens").search_session,
    --     { desc = "Search for auto sessions" }
    --   )
    -- end,
  },
}
