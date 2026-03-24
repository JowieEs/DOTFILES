return {
	-- 1. The Core Mason "App Store"
	{
		"williamboman/mason.nvim",
		opts = {}, -- Notice this is empty now!
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"pyright",
				"clangd",
				"gopls",
				"astro",
				"vtsls",
				"html",
				"cssls",
				"emmet_ls",
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"black",
				"gofumpt",
				"clang-format",
				"prettier",
				"stylua",
			},
		},
	},
}
