return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		{ mode = "n", "L", "<cmd>bnext<CR>", desc = "Buffer next" },
		{ mode = "n", "H", "<cmd>bprevious<CR>", desc = "Buffer previous" },
		{ mode = "n", "W", "<cmd>bdelete<CR>", desc = "Buffer delete" },
		{ mode = "n", "P", "<cmd>BufferLinePick<CR>", desc = "Buffer pick" },
	},
	config = function()
		require("bufferline").setup({})
	end,
}
