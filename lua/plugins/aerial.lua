return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ mode = "n", "}", "<cmd>AerialNext<CR>", desc = "Aerial next" },
		{ mode = "n", "{", "<cmd>AerialPrev<CR>", desc = "Aerial Prev" },
		{ mode = "n", "<leader>a", "<cmd>AerialToggle<CR>", desc = "Aerial Toggle" },
		{ mode = "n", "<leader>A", "<cmd>AerialNavToggle<CR>", desc = "Aerial Nav Toggle" },
	},
}
