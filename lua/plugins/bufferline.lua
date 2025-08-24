local mapKey = require("utils.KeyMapper").mapKey

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.default,
				separator_style = "slope",
				diagnostics_indicator = function(count, _, _, _)
					return "(" .. count .. ")"
				end,
			},
		})

		mapKey("<Tab>", ":BufferLineCycleNext<CR>", "n", { silent = true })
		mapKey("<S-Tab>", ":BufferLineCyclePrev<CR>", "n", { silent = true })
	end,
}
