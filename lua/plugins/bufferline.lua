return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VimEnter",
	keys = {
		{ mode = "n", "L", "<cmd>bnext<CR>", desc = "Buffer next" },
		{ mode = "n", "H", "<cmd>bprevious<CR>", desc = "Buffer previous" },
		{ mode = "n", "W", "<cmd>bdelete<CR>", desc = "Buffer delete" },
		{ mode = "n", "P", "<cmd>BufferLinePick<CR>", desc = "Buffer pick" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				indicator = {
					icon = "|",
					style = "underline",
				},
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "(" .. count .. ")"
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
