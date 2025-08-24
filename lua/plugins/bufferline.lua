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
				style_preset = bufferline.style_preset.no_italic,
				separator_style = "slant",
				diagnostics_indicator = function(_, _, diagnostics_dict, _)
					local icons = { Error = "", Warn = "", Info = "" }
					local s = ""
					for type, icon in pairs(icons) do
						if diagnostics_dict[type] and diagnostics_dict[type] > 0 then
							s = s .. icon .. diagnostics_dict[type] .. " "
						end
					end
					return s ~= "" and (" " .. s) or ""
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = true,
						highlight = "Directory",
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				name_formatter = function(buf)
					return "  " .. buf.name .. "  " -- 좌우 마진
				end,
				mouse_mode = "drag-and-drop",
			},
		})

		mapKey("<Tab>", ":BufferLineCycleNext<CR>", "n", { silent = true })
		mapKey("<S-Tab>", ":BufferLineCyclePrev<CR>", "n", { silent = true })
	end,
}
