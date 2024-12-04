-- local wk = require("which-key")
return {
	"folke/which-key.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", event = "VeryLazy" },
		{"nvim-tree/nvim-web-devicons", event = "VeryLazy"},
	},
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	-- config = function()
	-- 	wk.add({
	-- 		{ "<leader>f", group = "Telescpoe" },
	-- 	})
	-- end,
}
