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
		opts = {
			window = {
				float = {
					enable = true,
					position = "center",
					border = "rounded",
				},
			},
		},
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					indent = {
						padding = 1,
						indent_size = 2,
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
					},
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
					auto_open = false,
					follow_current_file = true,
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
