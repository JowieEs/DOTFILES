-- --------------------------------------------------------------------
-- Nvim Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

-- --------------------------------------------------------------------
-- LSP keymaps
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
	})
end, { desc = "Format file using conform" })

-- --------------------------------------------------------------------
-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>Telescope live_grep<cr>",
	{ desc = "Live grep (Search text in all files)" }
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
vim.keymap.set(
	"n",
	"<leader>fw",
	"<cmd>Telescope grep_string<cr>",
	{ desc = "Find string in current buffer" }
)

-- --------------------------------------------------------------------
-- Clipboard keymaps
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- --------------------------------------------------------------------
-- Vim Diagnostics
vim.keymap.set(
	"n",
	"<leader>k",
	vim.diagnostic.open_float,
	{ desc = "Show diagnostic error messages" }
)

-- --------------------------------------------------------------------
-- Zen Mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })

-- --------------------------------------------------------------------
-- Codeium
vim.keymap.set("n", "<leader>tc", "<cmd>Codeium Toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Codeium",
})

vim.keymap.set("n", "<leader>cc", "<cmd>Codeium Chat<CR>", {
	noremap = true,
	silent = true,
	desc = "Codeium Chat",
})

-- --------------------------------------------------------------------
-- Toggle Term
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })

-- --------------------------------------------------------------------
-- LaTeX
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "VimTeX: Toggle Compilation" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "VimTeX: View PDF" })
vim.keymap.set(
	"n",
	"<leader>lc",
	"<cmd>VimtexClean<CR>",
	{ desc = "VimTeX: Clean Auxiliary Files" }
)
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "VimTeX: Show Errors" })
