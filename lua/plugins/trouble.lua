return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	config = function()
		require("trouble").setup({
			mods = {
				diagnostics = {
					filter = { severity = vim.diagnostic.severity.WARN },
				},
			},
			auto_preview = false,
			use_diagnostic_signs = true,
			fold_open = "",
			fold_closed = "",
			mode = "buffer_diagnostics",
		})
	end,
}
