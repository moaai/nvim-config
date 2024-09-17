return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<c-h>"] = "which_key",
						},
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
					live_grep = {
						theme = "ivy",
					},
					buffers = {
						theme = "ivy",
					},
					oldfiles = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
				layout_config = {
					horizontal = {
						preview_cutoff = 20,
					},
				},
			})

			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")

			local keymap = vim.keymap
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search for files" })
			keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
			keymap.set("n", "<leader>fh", builtin.help_tags, {})
			keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "List previously open files" })
		end,
	},
}
