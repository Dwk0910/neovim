return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 3,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
		})
	end,
}
