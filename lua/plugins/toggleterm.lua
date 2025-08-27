return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
				title_pos = "center",
			},
		})
	end,
}
