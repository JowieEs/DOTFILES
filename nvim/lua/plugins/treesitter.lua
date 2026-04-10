return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").install({
				"lua",
				"typescript",
				"tsx",
				"astro",
				"rust",
				"go",
				"cpp",
				"c",
				"css",
				"html",
				"json",
				"python",
				"zsh",
				"javascript",
				"toml",
				"yaml",
				"bash",
				"zig",
				"git_rebase",
				"git_config",
				"gitattributes",
				"gitignore",
				"markdown",
			})
		end,
	},
}
