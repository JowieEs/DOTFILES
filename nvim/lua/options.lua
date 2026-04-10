vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("syntax off")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.showmode = false
vim.opt.termguicolors = true

vim.opt.laststatus = 3
vim.o.list = true
vim.o.listchars = "tab:» ,lead:•,trail:•"

vim.opt.wrap = false

vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment", default = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
