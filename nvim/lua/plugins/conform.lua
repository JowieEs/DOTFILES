return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			local conform = require("conform")

			conform.setup({
				format_on_save = {
					timeout_ms = 2500,
					lsp_format = "fallback",
				},

				formatters_by_ft = {
					cpp = { "clang-format" },
					c = { "clang-format" },
					python = { "black" },
					go = { "golines" },
					astro = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					kotlin = { "ktfmt" },
					rust = { "rustfmt" },
				},

				formatters = {
					["clang-format"] = {
						prepend_args = { "--style=Google" },
					},
					["golines"] = {
						prepend_args = { "-m", "100", "--base-formatter=gofumpt" },
					},
				},
			})
		end,
	},
}
