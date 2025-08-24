local mapKey = require("utils.KeyMapper").mapKey

return {
	"vuki656/package-info.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		local package_info = require("package-info")
		package_info.setup({
			package_manager = "npm", -- npm, yarn, pnpm
		})

		mapKey("<leader>nt", package_info.toggle, "n", { silent = true, noremap = true })
		mapKey("<leader>nn", package_info.change_version, "n", { silent = true, noremap = true })
	end,
}
