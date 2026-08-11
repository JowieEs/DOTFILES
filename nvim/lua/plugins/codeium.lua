return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "InsertEnter",
	config = function()
		local orig_notify = vim.notify
		vim.notify = function(msg, level, opts)
			if type(msg) == "string" then
				local lower_msg = string.lower(msg)
				if
					string.find(lower_msg, "codeium")
					or string.find(lower_msg, "completion request failed")
				then
					return
				end
			end
			orig_notify(msg, level, opts)
		end

		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				filetypes = {
					bash = false,
					env = false,
				},
				key_bindings = {
					accept = "<C-g>",
					accept_word = false,
					accept_line = false,
					clear = "<C-e>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
		})
	end,
}
