return {
	"vuki656/package-info.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("package-info").setup({
			package_manager = "npm", -- npm, yarn, pnpm
		})
	end,
}
