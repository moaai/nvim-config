return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local onedark = require("lualine.themes.onedark")
			require("lualine").setup({
				options = { theme = onedark },
			})
		end,
	},
}
