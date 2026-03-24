return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("DisableSemanticTokens", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			-- Structure this explicitly to ensure the server sees it
			capabilities.workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			}
			vim.lsp.config("pyright", { capabilities = capabilities })

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
				},
			})

			vim.lsp.config("vtsls", { capabilities = capabilities })
			vim.lsp.config("astro", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("cssls", { capabilities = capabilities })
			vim.lsp.config("emmet_ls", { capabilities = capabilities })

			vim.lsp.enable({
				"pyright",
				"clangd",
				"gopls",
				"astro",
				"vtsls", -- Changed from ts_ls
				"html",
				"cssls",
				"emmet_ls",
			})

			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = {
					spacing = 4,
					prefix = "●",
				},
				signs = true,
				underline = true,
				severity_sort = true,
				float = {
					source = "always",
					border = "rounded",
				},
			})

			vim.o.updatetime = 250

			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					local opts = {
						focusable = false,
						close_events = {
							"BufLeave",
							"CursorMoved",
							"InsertEnter",
							"FocusLost",
						},
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})
		end,
	},

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
					go = { "gofumpt" },
					astro = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
				},

				formatters = {
					["clang-format"] = {
						prepend_args = { "--style=Google" },
					},
				},
			})
		end,
	},
}
