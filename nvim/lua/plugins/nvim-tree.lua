return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			view = {
				adaptive_size = true,
				width = 30,
			},

			filters = {
				custom = {
					"^.git$",
					"^node_modules$",
					"^.vscode$",
				},
				dotfiles = false,
			},
			git = {
				ignore = true,
			},
		},
	},
}
