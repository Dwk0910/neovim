vim.env.PATH = vim.env.PATH .. ";C:\\tools\\ripgrep\\bin"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Global Settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Settings for clipboard to use system clipboard

local has = function(x)
	return vim.fn.has(x) == 1
end

if has("win32") then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
elseif has("macunix") then
	vim.opt.clipboard:append({ "unnamedplus" })
end

-- Import configs
require("config.globals")
require("config.keymaps")
require("config.options")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = true },
})

-- Commands in `nvim_create_autocmd("VimEnter", {})` runs automatically when they are loaded.

-- Check updates
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("autoupdate"),
	callback = function()
		require("lazy").update({
			show = false,
		})
	end,
})

-- Set-up default layout
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(_)
		if vim.fn.argc() == 0 then
			vim.cmd([[Neotree toggle]])
			vim.cmd([[wincmd p]])
		end

		local args = vim.fn.argv()
		local bufnr = vim.fn.bufnr("neo-tree")
		if #args > 0 then
			local target = args[1]
			if vim.fn.isdirectory(target) ~= 1 then
				if bufnr == -1 then
					vim.cmd([[Neotree toggle]])
				end
			end
		end
	end,
})

-- This command allows to move cursor to the last edit position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- This allows to open `Trouble diagnostics` buffer automatically when current buffer has ERROR or WARN
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local function get_buffers_by_filetype(target_filetype)
			local matching_buffers = {}
			for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(bufnr) then
					local filetype = vim.bo[bufnr].filetype
					if filetype == target_filetype then
						table.insert(matching_buffers, bufnr)
					end
				end
			end
			return matching_buffers
		end

		if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
			local trouble_opened = false

			local trouble_bufnrs = get_buffers_by_filetype("trouble")
			for _, bufnr in ipairs(trouble_bufnrs) do
				if vim.api.nvim_buf_is_loaded(bufnr) then
					trouble_opened = true
					break
				end
			end

			local function open_trouble_screen()
				vim.cmd([[Trouble diagnostics open_no_results=true filter.buf=0]])
			end

			if not trouble_opened then
				open_trouble_screen()
			else
				for _, bufnr in ipairs(trouble_bufnrs) do
					if vim.api.nvim_buf_is_loaded(bufnr) then
						vim.api.nvim_buf_delete(bufnr, { force = true })
					end
				end
				open_trouble_screen()
			end
		else
			local trouble_bufnr = get_buffers_by_filetype("trouble")
			for _, bufnr in ipairs(trouble_bufnr) do
				if vim.api.nvim_buf_is_loaded(bufnr) then
					vim.api.nvim_buf_delete(bufnr, { force = true })
				end
			end
		end
	end,
})

-- This detects markdown files that named with `*.md` or `*.markdown` and set filetype to `markdown`
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.md", "*.markdown" },
	callback = function()
		vim.bo.filetype = "markdown"
	end,
})

-- virtual_text & other warning/comment settings

-- ** HIGHLIGHT GROUP CUSTOMIZATION **
-- set virtualtext color
vim.cmd([[
  highlight DiagnosticVirtualTextError guifg=#FF6E6E guibg=#3E1F1F
  highlight DiagnosticVirtualTextWarn  guifg=#FFD55F guibg=#3E3A1F
  highlight DiagnosticVirtualTextInfo  guifg=#6EAFFF guibg=NONE
  highlight DiagnosticVirtualTextHint  guifg=#537199 guibg=NONE
]])
-- set neotree colors
vim.cmd([[
    highlight NeoTreeIndentMarker guifg=#4E4E4E
    highlight NeoTreeExpander guifg=#537199
    highlight NeoTreeModified guifg=#FFD55F
]])

vim.diagnostic.config({
	virtual_text = {
		prefix = " ",
		spacing = 3,
		source = false,
		format = function(diagnostic)
			return diagnostic.message .. " "
		end,
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "💡",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.o.updatetime = 300
