return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
			},
		})
		-- Notify plugin default settings
		vim.cmd([[
            highlight NotifyERRORBorder guifg=#8A1F1F
            highlight NotifyWARNBorder guifg=#79491D
            highlight NotifyINFOBorder guifg=#4F6752
            highlight NotifyDEBUGBorder guifg=#8B8B8B
            highlight NotifyTRACEBorder guifg=#4F3552
            highlight NotifyERRORIcon guifg=#F70067
            highlight NotifyWARNIcon guifg=#F79000
            highlight NotifyINFOIcon guifg=#A9FF68
            highlight NotifyDEBUGIcon guifg=#8B8B8B
            highlight NotifyTRACEIcon guifg=#D484FF
            highlight NotifyERRORTitle  guifg=#F70067
            highlight NotifyWARNTitle guifg=#F79000
            highlight NotifyINFOTitle guifg=#A9FF68
            highlight NotifyDEBUGTitle  guifg=#8B8B8B
            highlight NotifyTRACETitle  guifg=#D484FF
            highlight link NotifyERRORBody Normal
            highlight link NotifyWARNBody Normal
            highlight link NotifyINFOBody Normal
            highlight link NotifyDEBUGBody Normal
            highlight link NotifyTRACEBody Normal
        ]])
	end,

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
}
