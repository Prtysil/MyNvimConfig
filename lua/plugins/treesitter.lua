return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow", -- colored rainbow
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Add which language you want
				-- NOTE: Please run ":TSInstall [language]" command after config target language
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"vim",
					"markdown",
					"markdown_inline",
					"verilog",
					-- "systemverilog",
					"python",
					"json",
					"javascript",
					"scala",
				},
				highlight = {
					enable = true,
					disable = {},
				},
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	},
}
