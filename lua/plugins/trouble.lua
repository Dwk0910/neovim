return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	config = function()
		require("trouble").setup({
			auto_open = true,
			auto_close = true,
		})
	end,
}
