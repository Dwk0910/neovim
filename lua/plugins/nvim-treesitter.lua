return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			sync_install = false,
			highlight = {
				enable = true,
				disable = function(_, buf)
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
