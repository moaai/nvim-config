return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})

			vim.keymap.set("n", "<leader>bl", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Blame Line" })

			vim.keymap.set("n", "]h", function()
				gitsigns.next_hunk({ full = true })
			end, { desc = "Next hunk" })

			vim.keymap.set("n", "[h", function()
				gitsigns.prev_hunk({ full = true })
			end, { desc = "Prev hunk" })

			vim.keymap.set("n", "<leader>hp", function()
				gitsigns.preview_hunk({ full = true })
			end, { desc = "Preview hunk" })
		end,
	},
}
