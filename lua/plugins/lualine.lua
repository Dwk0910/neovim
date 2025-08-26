return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Everforest Optimized Lualine for React/Tailwind with full language icons + time
		local lualine = require("lualine")

		-- Colors
		local colors = {
			bg = "#2b3330",
			fg = "#d3cfc9",
			yellow = "#d0a86b",
			cyan = "#7fb4ca",
			darkblue = "#081633",
			green = "#8fb28f",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#d08b8b",
			gray = "#6a7268",
		}

		-- Conditions
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
		}

		-- Config
		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		}

		-- Utility
		local function ins_left(comp)
			table.insert(config.sections.lualine_c, comp)
		end
		local function ins_right(comp)
			table.insert(config.sections.lualine_x, comp)
		end

		-- Decorative left block
		ins_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 0, right = 1 },
		})

		-- Mode pill with text
		ins_left({
			function()
				local modes = {
					n = "NORMAL",
					i = "INSERT",
					v = "VISUAL",
					V = "V-LINE",
					c = "COMMAND",
					s = "SELECT",
					R = "REPLACE",
					t = "TERMINAL",
				}
				local m = vim.fn.mode()
				return " " .. (modes[m] or m) .. " "
			end,
			color = function()
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					s = colors.orange,
					R = colors.violet,
					t = colors.red,
				}
				return { fg = colors.bg, bg = mode_color[vim.fn.mode()] or colors.gray, gui = "bold" }
			end,
			separator = { left = "", right = "" },
			padding = 0,
		})

		-- File size
		ins_left({ "filesize", cond = conditions.buffer_not_empty })

		-- Full language icons
		local icons = {
			-- Web / JS / TS
			javascript = "",
			typescript = "",
			tsx = "",
			javascriptreact = "",
			typescriptreact = "",
			react = "",
			html = "",
			css = "",
			scss = "",
			vue = "󰡄",
			svelte = "",
			angular = "",
			-- Backend / scripts
			lua = "",
			python = "",
			ruby = "",
			go = "",
			rust = "",
			php = "",
			java = "",
			kotlin = "",
			c = "",
			cpp = "",
			cs = "",
			-- Config / markup
			json = "",
			yaml = "",
			toml = "",
			xml = "󰗀",
			markdown = "",
			dockerfile = "",
			gitignore = "",
			gitattributes = "",
			default = "",
		}

		-- Filename with icon
		ins_left({
			function()
				local ft = vim.bo.filetype
				local icon = icons[ft] or icons.default
				local filename = vim.fn.expand("%:t")
				local max_len = 15 -- 상태줄에서 최대 표시 길이
				if #filename > max_len then
					filename = filename:sub(1, max_len - 3) .. "..." -- 뒤를 …로
				end
				return string.format(" %s %s ", icon, filename)
			end,
			cond = conditions.buffer_not_empty,
			color = { fg = colors.magenta, gui = "bold" },
		})

		-- Cursor location & progress
		ins_left({ "location" })
		ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

		-- Diagnostics
		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		-- Spacer/mid
		ins_left({
			function()
				return "%="
			end,
		})

		-- Middle: safe 12-hour time
		ins_left({
			function()
				local hour24 = tonumber(os.date("%H")) -- 0~23
				local minute = tonumber(os.date("%M"))
				local ampm = hour24 >= 12 and "PM" or "AM"
				local hour12 = hour24 % 12
				if hour12 == 0 then
					hour12 = 12
				end
				return string.format("%02d:%02d %s", hour12, minute, ampm)
			end,
			color = { fg = colors.cyan, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		-- Right section
		ins_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			color = { fg = colors.green, gui = "bold" },
		})
		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false,
			color = { fg = colors.green, gui = "bold" },
		})
		ins_right({ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } })
		ins_right({
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})

		-- Decorative right block
		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		})

		-- Initialize
		lualine.setup(config)
	end,
}
