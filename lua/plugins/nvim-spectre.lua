return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ mode = "n", "<leader>rt", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
		{
			mode = "n",
			"<leader>rw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = "Search current word",
		},
		{
			mode = "v",
			"<leader>rw",
			'<cmd>lua require("spectre").open_visual()<CR>',
			desc = "Search current word",
		},
		{
			mode = "n",
			"<leader>rf",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			desc = "Search on current file",
		},
	},
}
