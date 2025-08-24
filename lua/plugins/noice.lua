return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				background_colour = "#000000",
			},
		},
	},
	enabled = true,
	config = function()
		require("noice").setup({
			presets = {
				command_palette = {
					views = {
						cmdline_popup = {
							position = {
								row = "10%", -- Vertical position (e.g., center)
								col = "50%", -- Horizontal position (e.g., center)
							},
							-- Other size and style options...
						},
					},
				},
			},
		})
	end,
}
