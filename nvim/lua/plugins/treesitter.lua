return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- The docs explicitly say: "This plugin does not support lazy-loading."
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			ts.install({
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
				"bash",
			})
		end,
	},
}
