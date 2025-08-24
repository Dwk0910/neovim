return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d", "prettierd" },
				typescript = { "eslint_d", "prettierd" },
				javascriptreact = { "eslint_d", "prettierd" },
				typescriptreact = { "eslint_d", "prettierd" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = true,
				stop_after_first = false,
			},
		})
	end,
}
