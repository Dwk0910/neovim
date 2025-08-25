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
				container = {
					enable_charactor_fade = true,
				},
				source_selector = {
					winbar = false,
					statusline = true,
				},
				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						-- expander config, needed for nesting files
						with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					modified = {
						symbol = "●",
						highlight = "NeoTreeModified",
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
					follow_current_file = { enabled = true },
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_hidden = false,
					},
				},
			})

			-- auto git status reload
			require("neo-tree.sources.manager").refresh(require("neo-tree.sources.manager").get_state("filesystem"))
		end,
	},
}
