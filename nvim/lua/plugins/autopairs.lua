return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- enable treesitter integration
				disable_filetype = { "TelescopePrompt", "vim" },
				ts_config = {
					html = { "html" },
					astro = { "html" },
				},
			})
		end,
	},
}
