local keymap = vim.keymap

keymap.set("n", "<leader>1", "1gt", { desc = "Switch to Tab 1" })
keymap.set("n", "<leader>2", "2gt", { desc = "Switch to Tab 2" })
keymap.set("n", "<leader>3", "3gt", { desc = "Switch to Tab 3" })
keymap.set("n", "<leader>4", "4gt", { desc = "Switch to Tab 4" })
keymap.set("n", "<leader>5", "5gt", { desc = "Switch to Tab 5" })
keymap.set("n", "<leader>6", "6gt", { desc = "Switch to Tab 6" })
keymap.set("n", "<leader>7", "7gt", { desc = "Switch to Tab 7" })
keymap.set("n", "<leader>8", "8gt", { desc = "Switch to Tab 7" })

if vim.loop.os_uname().sysname == "Darwin" then
  keymap.set(
    "n",
    "<leader><CR>",
    ":vsplit term://fish <CR> :set nonumber <CR> :set norelativenumber <CR>",
    { desc = "Open terminal" }
  )
else
end

keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", { desc = "Left" })
keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h", { desc = "Left" })

keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", { desc = "Right" })
keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l", { desc = "Right" })

keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", { desc = "Top" })
keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k", { desc = "Top" })

keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", { desc = "Bottom" })
keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j", { desc = "Bottom" })

-- :tnoremap <A-h> <C-\><C-N><C-w>h
--
-- :tnoremap <A-j> <C-\><C-N><C-w>j
-- :tnoremap <A-k> <C-\><C-N><C-w>k
-- :tnoremap <A-l> <C-\><C-N><C-w>l
-- :inoremap <A-h> <C-\><C-N><C-w>h
-- :inoremap <A-j> <C-\><C-N><C-w>j
-- :inoremap <A-k> <C-\><C-N><C-w>k
-- :inoremap <A-l> <C-\><C-N><C-w>l
-- :nnoremap <A-h> <C-w>h
-- :nnoremap <A-j> <C-w>j
-- :nnoremap <A-k> <C-w>k
-- :nnoremap <A-l> <C-w>l

-- ===================================================================
-- <leader>t → Toggles
-- ===================================================================
keymap.set("n", "<leader>tr", function()
  local fidget = require("fidget")
  local current = vim.opt.relativenumber:get()
  vim.opt.relativenumber = not current
  fidget.notify("Relative numbers " .. (not current and "ON" or "OFF"))
end, { desc = "Toggle relative line numbers" })

keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<cr>", { desc = "Aerial toggle" })

keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current blame Line" })
keymap.set("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted (virtual lines)" })
keymap.set("n", "<leader>tl", "<cmd>Gitsigns toggle_linehl<CR>", { desc = "Toggle line highlight" })
keymap.set("n", "<leader>tp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })

-- ===================================================================
-- <leader>f → Toggles
-- ===================================================================
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Search for files" })
keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Grep" })
keymap.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>", { desc = "Grep string" })
keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "List open buffers" })
keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", {})
keymap.set("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", { desc = "List previously open files" })

-- ===================================================================
-- <leader>c → Toggles
-- ===================================================================

-- ===================================================================
-- Everything else
-- ===================================================================
keymap.set("n", "]h", "<CMD>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
keymap.set("n", "[h", "<CMD>Gitsigns prev_hunk <CR>", { desc = "Prev hunk" })

keymap.set("n", "<leader>ti", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggles inline hints" })

-- -- Jump to the start of any word
keymap.set("", "<leader>w", "<CMD>HopWord<CR>", { silent = true, desc = "Jump to the start of any word" })
keymap.set("", "<leader>l", "<CMD>HopLine<CR>", { silent = true, desc = "Jump to the beginning of any line" })
