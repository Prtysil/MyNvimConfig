return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = { theme = "codedark" },

			-- INFO: For xmake.nvim plugin
			sections = {
				lualine_y = {
					{
						function()
							if not vim.g.loaded_xmake then
								return ""
							end
							local Info = require("xmake.info")
							if Info.mode.current == "" then
								return ""
							end
							if Info.target.current == "" then
								return "Xmake: Not Select Target"
							end
							return ("%s(%s)"):format(Info.target.current, Info.mode.current)
						end,
						cond = function()
							return vim.o.columns > 100
						end,
					},
				},
			},
		})
	end,
}
