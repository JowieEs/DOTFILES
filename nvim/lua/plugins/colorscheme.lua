return {
	{
		"blazkowolf/gruber-darker.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
		end,
	},
	{
		"neovim-idea/catppuccin-reloaded-nvim",
		dependencies = { "catppuccin/nvim" },
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin-reloaded").setup({
				flavour = "intellijdark",
			})
			vim.opt.termguicolors = true
		end,
	},
	{
		"xiantang/darcula-dark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			vim.g.gruvbox_material_background = "hard"
		end,
	},
	{
		"ember-theme/nvim",
		name = "ember",
		lazy = false,
		priority = 1000,
		config = function()
			require("ember").setup({
				variant = "ember", -- "ember" | "ember-soft" | "ember-light"
			})
			vim.opt.termguicolors = true
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "warm",
				toggle_style_key = "<leader>tc",
				transparent = true,
			})
			require("onedark").load()
		end,
	},
	{
		"vcraescu/islands-dark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("islands-dark").setup({})
			vim.opt.termguicolors = true
		end,
	},
}
