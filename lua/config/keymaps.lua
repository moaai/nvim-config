-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
map('n', "t", ":FloatermToggle myfloat<CR>")
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")

local builtin = require('telescope.builtin')
local keymap = vim.keymap
keymap.set('n', '<leader>ff', builtin.find_files, {desc="Search for files"})
keymap.set('n', '<leader>fg', builtin.live_grep, {desc="Grep"})
keymap.set('n', '<leader>fb', builtin.buffers, {desc="List open buffers"})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fo', builtin.oldfiles, {desc="List previously open files"})

-- keymap.set('n', '<leader>fm', vim.lsp.buf.format, {desc="Format file"})

keymap.set('n', '<leader>fa', vim.lsp.buf.code_action, {})
keymap.set('n', '<leader>fh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, {desc="Toggles inline hints"})

keymap.set('n', '<leader>gg', vim.lsp.buf.hover, {})
