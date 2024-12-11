local keymap = vim.keymap

keymap.set("n", "<leader>1", "1gt", { desc = "Switch to Tab 1" })
keymap.set("n", "<leader>2", "2gt", { desc = "Switch to Tab 2" })
keymap.set("n", "<leader>3", "3gt", { desc = "Switch to Tab 3" })
keymap.set("n", "<leader>4", "4gt", { desc = "Switch to Tab 4" })
keymap.set("n", "<leader>5", "5gt", { desc = "Switch to Tab 5" })
keymap.set("n", "<leader>6", "6gt", { desc = "Switch to Tab 6" })
keymap.set("n", "<leader>7", "7gt", { desc = "Switch to Tab 7" })
keymap.set("n", "<leader>8", "8gt", { desc = "Switch to Tab 7" })

if vim.loop.os_uname().sysname == "Linux" then
  keymap.set(
    "n",
    "t",
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
