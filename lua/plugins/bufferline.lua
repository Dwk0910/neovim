local mapKey = require("utils.KeyMapper").mapKey

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				show_buffer_close_icons = true,
				show_close_icon = false,
			},
		})

		mapKey("<Tab>", ":BufferLineCycleNext<CR>", "n", { silent = true })
		mapKey("<S-Tab>", ":BufferLineCyclePrev<CR>", "n", { silent = true })
	end,
}
