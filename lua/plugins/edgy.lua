return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		opts = {
			animate = { enabled = true },
			left = { -- left-sidebar
				{
					title = "File Explorer",
					ft = "neo-tree",
					size = { width = 30 },
					pinned = true,
				},
				{
					title = "Problems",
					ft = "trouble",
					size = { height = 18 },
					pinned = true,
					open = "Trouble diagnostics open_no_results=true",
				},
			},
		},
	},
}
