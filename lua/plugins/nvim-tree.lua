return {
	"nvim-tree/nvim-tree.lua",
	denpendencies = { "kyazdani42/nvim-web-devicons" },
	-- cmd = "NvimTree",
	event = "VeryLazy",
	keys = {
		{ mode = "n", "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
		{ mode = "n", "<leader>E", "<cmd>NvimTreeFocus<CR>", desc = "Toggle nvim-tree" },
	},
	config = function()
		-- empty setup using defaults
		-- require("nvim-tree").setup()
		-- OR setup with some options
		require("nvim-tree").setup({
			sort = { sorter = "case_sensitive" },
			view = { width = 30 },
			renderer = { group_empty = true },
			filters = { dotfiles = true },
		})

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true
	end,
}
