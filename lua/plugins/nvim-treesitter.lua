return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "java", "javascript", "typescript", "html", "css" },
			sync_install = false,
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local ok, _ = pcall(function()
						return vim.api.nvim_buf_line_count(buf) > 1000
					end)
					return not ok
				end,
			},
			indent = { enable = true },
		})
	end,
}
