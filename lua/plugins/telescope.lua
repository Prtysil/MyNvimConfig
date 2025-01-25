local builtin = require("telescope.builtin")
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
	},
	keys = {
		{ "<leader>p", group = "file", desc = "Telescope" },
		{ mode = "n", "<leader>ff", builtin.find_files, desc = "Telescope find files" },
		{ mode = "n", "<leader>fh", builtin.help_tags, desc = "Telescope help tags" },
		{ mode = "n", "<leader>fg", builtin.live_grep, desc = "Telescope live grep string" },
		{ mode = "n", "<leader>fr", builtin.lsp_references, desc = "Lists LSP references for word" },
		{ mode = "n", "<leader>fw", builtin.grep_string, desc = "Telescope grep cursor choosed string" },
		{ mode = "n", "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
		{ mode = "n", "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Telescope project" },
		{ mode = "n", "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
		{ mode = "n", "<leader>fs", "<cmd>Telescope smart_open<cr>", desc = "Telescope smart open" },
	},

	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("projects")
		require("telescope").load_extension("smart_open")
	end,
}
