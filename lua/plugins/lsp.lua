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
			"b0o/schemastore.nvim",
		},

		config = function()
			local lspconfig = require("lspconfig")

			-- Luascript LSP Configuration
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

			-- Configurations for react development
			lspconfig.eslint.setup({
				settings = {
					format = {
						indentSize = vim.o.shiftwidth,
						convertTabsToSpaces = vim.o.expandtab,
						tabSize = vim.o.tabstop,
					},
				},
			})

			lspconfig.ts_ls.setup({
				on_attach = function(client, _)
					-- Disable tsserver formatting if eslint is available
					local eslint = lspconfig.eslint
					if eslint then
						client.server_capabilities.documentFormattingProvider = false
					end
				end,
				settings = {
					typescript = {
						format = {
							indentSize = vim.o.shiftwidth,
							convertTabsToSpaces = vim.o.expandtab,
							tabSize = vim.o.tabstop,
						},
					},
					javascript = {
						format = {
							indentSize = vim.o.shiftwidth,
							convertTabsToSpaces = vim.o.expandtab,
							tabSize = vim.o.tabstop,
						},
					},
				},
			})

			lspconfig.tailwindcss.setup({
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"astro",
				},
				settings = {
					tailwindCSS = {
						-- 자동 완성 할 속성들
						classAttributes = { "class", "className", "ngClass", "tw", "classnames" },

						-- 다른 언어에서 tailwind를 쓰려면 매핑
						includeLanguages = {
							typescript = "javascript",
							typescriptreact = "javascript",
							svelte = "html",
							rust = "html", -- 예시: Dioxus 등
						},

						-- 정규식으로 커스텀 클래스 위치 찾기 (예: tw`...`, class: "...", etc)
						experimental = {
							classRegex = {
								'class[:=]\\s*"(.*?)"',
								'className[:=]\\s*"(.*?)"',
								"tw`([^`]*)`",
								'cva\\((?:[^,]+),\\s*"(.*?)"',
							},
						},

						validate = true, -- LSP에서 검사/자동완성 켜기
					},
				},
			})

			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			-- lspconfig.marksman.setup({})
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

	-- lspkind
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = "symbol_text",
				preset = "default",
				symbol_map = {
					Text = "",
					Method = "ƒ",
					Function = "",
					Constructor = "",
					Field = "",
					Variable = "𝓍",
					Class = "",
					Interface = "",
					Module = "",
					Property = "",
					Unit = "",
					Value = "",
					Enum = "了",
					Keyword = "⚡",
					Snippet = "",
					Color = "",
					File = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "",
				},
			})
		end,
	},

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
				hover = {
					max_width = 80,
					max_height = 30,
				},

				-- 코드 구조 표시 안함 (barbecue와 겹침)
				symbol_in_winbar = {
					enable = false,
				},

				diagnostic = {
					extend_relatedInformation = true,
					jump_num_shortcut = true,
				},

				ui = {
					border = "rounded",
					lines = { "┗", "┣", "┃", "━", "┏" },
					action_fix = "",
					devicon = true,
					title = true,
					expand = "⊞",
					collapse = "⊟",
					kind = {},
					imp_sign = "󰳛 ",
					enable = true,
					frequency = 7,
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
				},

				diagnostic_signs = true,
				hover_handler = "lspsaga",
				signature_help_handler = "lspsaga",
			})
		end,
	},
}
