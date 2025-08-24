return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			require("neo-tree").setup({
				source_selector = {
					winbar = false,
					statusline = false,
				},
				default_component_configs = {
					git_status = {
						symbols = {
							added = "",
							modified = "",
							deleted = "",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				filesystem = {
					follow_current_file = { enabled = true },
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_hidden = false,
					},
				},
			})
		end,
	},
}
