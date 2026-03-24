vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

-- LSP keymaps
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<space>f', function()
  require("conform").format({ 
    async = true, 
    lsp_fallback = true
  })
end, { desc = "Format file using conform" })

vim.keymap.set('n', '<space>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<space>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep (Search text in all files)' })
vim.keymap.set('n', '<space>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find open buffers' })
