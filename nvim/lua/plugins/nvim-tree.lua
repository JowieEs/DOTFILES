return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
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
			})
		end,
	},
}
