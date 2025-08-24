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
				diagnostics_indicator = function(_, _, diagnostics_dict, _)
					local icon = ""
					if diagnostics_dict.Error then
						icon = ""
					elseif diagnostics_dict.Warn then
						icon = ""
					end
					return " " .. icon .. " "
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = true,
						highlight = "Directory",
					},
				},
				show_buffer_close_icon = true,
				show_close_icon = true,
				mouse_mode = "drag-and-drop",
			},
		})

		mapKey("<Tab>", ":BufferLineCycleNext<CR>", "n", { silent = true })
		mapKey("<S-Tab>", ":BufferLineCyclePrev<CR>", "n", { silent = true })
	end,
}
