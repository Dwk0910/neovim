return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = function(_, opts)
		opts.routes = opts.routes or {}

		table.insert(opts.routes, {
			filter = {
				event = "notify",
				find = "No information available",
			},
			opts = { skip = true },
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
