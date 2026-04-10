return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- One statusline for all windows
			},
			sections = {
				-- Only show what you actually need
				lualine_a = { {
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				} }, -- Just 'N', 'I', 'V'
				lualine_b = { "branch" },
				lualine_c = { { "filename", file_status = true, path = 1 } }, -- Path = 1 shows relative path
				lualine_x = { "diagnostics", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
