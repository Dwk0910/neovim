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
		config = function() end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					lines = { "┗", "┣", "┃", "━", "┏" },
					border = "single",
					code_action = "💡",
					action_fix = " ",
					devicon = true,
					title = true,
					expand = "⊞",
					collapse = "⊟",
					kind = {},
					imp_sign = "󰳛 ",
					enable = true,
					frequency = 7,
				},
				symbol_in_winbar = {
					enable = true,
				},
				lightbulb = {
					enable = true,
					sign = true,
					debounce = 10,
				},
				beacon = {
					enable = true,
				},
				inlay_hint = {
					enable = true,
					separator = "  ",
					hightlight = "Comment",
				},
				diagnostic_signs = true,
				horver_handler = "lspsaga",
				signature_help_handler = "lspsaga",
			})

			KeyMapper("H", "<cmd>Lspsaga hover_doc<CR>")
			KeyMapper("K", "<cmd>Lspsaga show_line_diagnostics<CR>")
			KeyMapper("<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
			KeyMapper("<leader>ca", "<cmd>Lspsaga code_action<CR>")
			KeyMapper("<leader>rn", "<cmd>Lspsaga rename<CR>")
		end,
	},
}
