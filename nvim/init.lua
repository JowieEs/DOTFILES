vim.env.PATH = vim.fn.expand("~/.cargo/bin") .. ":" .. vim.env.PATH
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--vim.api.nvim_create_autocmd("FileType", {
--	pattern = {
--		"typescript",
--		"tsx",
--		"astro",
--		"lua",
--		"rust",
--		"go",
--		"python",
--		"markdown",
--		"cpp",
--		"json",
--		"javascript",
--		"c",
--		"jsonc",
--		"css",
--		"html",
--	},
--	callback = function()
--		vim.treesitter.start()
--	end,
--})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype

		if lang and vim.treesitter.language.add(lang) then
			pcall(vim.treesitter.start)
		end
	end,
})

require("options")
require("keymaps")
require("lazy").setup("plugins")
