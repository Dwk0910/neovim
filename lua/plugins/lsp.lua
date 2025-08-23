local KeyMapper = require("utils.KeyMapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls", "jsonls", "eslint" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.eslint.setup({})

			KeyMapper("K", vim.lsp.buf.hover)
			KeyMapper("gd", vim.lsp.buf.definition)
			KeyMapper("<leader><CR>", vim.lsp.buf.code_action)
		end,
	},
}
