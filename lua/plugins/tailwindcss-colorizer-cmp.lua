return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	config = function()
		require("tailwindcss-colorizer-cmp").setup({
			color_squre_width = 2,
			color_squre_background = false,
			-- color_square_width = 2,
			-- color_square_height = 1,
			-- show_color_code = true,
			-- show_color_square = true,
			-- tailwind_version = "3.2.7",
			-- mode = "background", -- or 'foreground' or 'background'
			-- enable_tailwind_colors = true,
			-- enable_basic_colors = true,
			-- enable_extended_colors = true,
			-- enable_css_colors = true,
			-- enable_hex_colors = true,
		})
	end,
	dependencies = { "hrsh7th/nvim-cmp" },
}
