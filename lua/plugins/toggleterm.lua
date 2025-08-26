local mapKey = require("utils.KeyMapper").mapKey

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shell = "powershell",
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
				title_pos = "center",
			},
		})

		mapKey("C", "<cmd>ToggleTerm<CR>", "n", { noremap = true, silent = true })
	end,
}
