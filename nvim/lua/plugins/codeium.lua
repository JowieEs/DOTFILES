return {
	"Exafunction/codeium.nvim",
	cmd = "Codeium",
	event = "InsertEnter",
	build = ":Codeium Auth",
	opts = {
		-- This handles the ghost text natively within the plugin
		virtual_text = {
			enabled = true,
			key_bindings = {
				accept = "<C-g>", -- Accept suggestion
				next = "<M-]>", -- Cycle next
				prev = "<M-[>", -- Cycle previous
				clear = "<C-x>", -- Clear suggestion
			},
			filetypes = {
				bash = false,
				env = false,
			},
		},
	},
}
