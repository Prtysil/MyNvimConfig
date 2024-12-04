return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- 确保安装，根据需要填写
				ensure_installed = { "lua_ls", "c", "cpp", "verilog", "systemverilog" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- More details see https://github.com/hrsh7th/nvim-cmp
			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").clangd.setup({ capabilities = capabilities })
			require("lspconfig").verible.setup({
				capabilities = capabilities,
				cmd = { "verible-verilog-ls", "--rules_config_search" },
			})
		end,
	},
}
