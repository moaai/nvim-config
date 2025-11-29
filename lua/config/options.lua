-- disable netrw at the very start of your init.lua (strongly advised) - that is from nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

opt.virtualedit = "block"
opt.splitright = true

-- Clear highlights on search when pressing <Esc> in normal mode
-- vim.o.hls = false
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- opt.tabstop = 2
-- opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

vim.o.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

vim.opt.number = true
vim.opt.relativenumber = true

opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
]])

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Always show absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = true
