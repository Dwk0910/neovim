return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[C]],
			direction = "float",
			shell = "powershell",
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
				title_pos = "center",
			},
		})
	end,
}
