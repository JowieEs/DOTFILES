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

			vim.lsp.config("kotlin_lsp", { capabilities = capabilities })
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
			vim.lsp.config("templ", { capabilities = capabilities })

			vim.lsp.config("htmx", {
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})

			vim.lsp.enable({
				"pyright",
				"clangd",
				"gopls",
				"astro",
				"vtsls", -- Changed from ts_ls
				"html",
				"cssls",
				"emmet_ls",
				"templ",
				"htmx",
				"kotlin_lsp",
			})

			vim.diagnostic.config({
				update_in_insert = true,
				signs = true,
				virtual_text = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
					max_width = 40,
				},
			})
		end,
	},
}
