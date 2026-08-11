return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function codeium_status()
			local ok, virtual_text = pcall(require, "codeium.virtual_text")
			if not ok then
				return ""
			end

			local status = virtual_text.status()

			if status.state == "idle" then
				return " "
			end

			if status.state == "waiting" then
				return "Waiting..."
			end

			if status.state == "completions" and status.total > 0 then
				return string.format("Codeium %d/%d", status.current, status.total)
			end

			return " 0 "
		end
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- One statusline for all windows
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				}, -- Just 'N', 'I', 'V'
				lualine_b = { "branch" },
				lualine_c = { { "filename", file_status = true, path = 1 } }, -- Path = 1 shows relative path
				lualine_x = { codeium_status, "diagnostics", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
