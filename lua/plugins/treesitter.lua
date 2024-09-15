return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {},
				ignore_install = {},
				sync_install = true,
				modules = {},
				auto_install = true,
				autotag = {
					enable = true,
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
				incremental_selection = {
					enable = true,
					-- Find better keymaps
					-- keymaps = {
					--   init_selection = '<CR>',
					--   scope_incremental = '<CR>',
					--   node_incremental = '<TAB>',
					--   node_decremental = '<S-TAB>',
					-- }
				},
			})
		end,
	},
}
