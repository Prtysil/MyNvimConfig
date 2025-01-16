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
		{ mode = "n", "<leader>fw", builtin.grep_string, desc = "Telescope grep cursor choosed string" },
		{ mode = "n", "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
		{ mode = "n", "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Telescope project" },
	},
}
