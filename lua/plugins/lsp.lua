return {
	-- Utility
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls" },
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.fn.split(package.path, ";"),
						},
						workspace = {
							checkThirdParty = false,
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("data") .. "lazy/lazy.nvim"] = true,
							},
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},

	-- Style
	-- Auto Completion
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },

	-- Snippets
	{ "L3MON4D3/LuaSnip", event = "InsertEnter" },

	-- Styler
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "LspAttach",
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
				-- symbols_in_winbar = {
				-- 	enable = true,
				-- },
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
				},
				diagnostic_signs = true,
				hover_handler = "lspsaga",
				signature_help_handler = "lspsaga",
			})
		end,
	},
}
