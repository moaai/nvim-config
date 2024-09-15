return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local custom_gruvbox = require("lualine.themes.onedark")
			require("lualine").setup({
				options = { theme = custom_gruvbox },
			})
		end,
	},
}
