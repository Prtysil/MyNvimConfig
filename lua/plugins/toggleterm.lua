return {
	{
		"akinsho/toggleterm.nvim",
		-- lazy = true,
		event = "VeryLazy",
		version = "*",
		-- opts = {--[[ things you want to change go here]]
		-- },
		config = function()
			require("toggleterm").setup({
				terminal_mappings = true,
				open_mapping = [[<c-t>]],
				start_in_insert = true,
				direction = "float",
				shell = vim.o.shell,
				size = 10,
			})
		end,
	},
}
