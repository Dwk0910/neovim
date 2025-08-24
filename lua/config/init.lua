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

-- Commands in `nvim_create_autocmd()` runs automatically when they are loaded.
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
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function(args)
		local diagnostics = vim.diagnostic.get(args.buf)
		local has_errors = false

		for _, d in ipairs(diagnostics) do
			if d.severity == vim.diagnostic.severity.ERROR or d.severity == vim.diagnostic.severity.WARN then
				has_errors = true
				break
			end
		end

		if has_errors then
			local ok, trouble = pcall(require, "trouble")
			if ok and not trouble.is_open() then
				vim.cmd("Trouble diagnostics open")
			end
		end
	end,
})

-- virtual_text & other warning/comment settings
-- set virtualtext color
vim.cmd([[
  highlight DiagnosticVirtualTextError guifg=#FF6E6E guibg=#3E1F1F
  highlight DiagnosticVirtualTextWarn  guifg=#FFD55F guibg=#3E3A1F
  highlight DiagnosticVirtualTextInfo  guifg=#6EAFFF guibg=NONE
  highlight DiagnosticVirtualTextHint  guifg=#537199 guibg=NONE
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
	update_in_insert = false,
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
vim.cmd([[
    augroup ShowDiagnosticsOnHover
        autocmd!
        autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    augroup END
]])

-- Welcome Message
require("notify")(" Welcome! ", "info", { title = "Set-up completed" })
