return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			-- vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})

			vim.keymap.set("n", "<leader>ft", function()
				local fidget = require("fidget")
				local current = vim.o.foldcolumn
				vim.o.foldcolumn = current == "0" and "1" or "0"
				fidget.notify("Fold column " .. (current == "0" and "1" or "0"))
			end, { desc = "Toggle fold column" })
		end,
	},
}
