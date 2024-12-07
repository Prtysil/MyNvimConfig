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
				ensure_installed = { "lua_ls", "clangd", "verible" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- More details see https://github.com/hrsh7th/nvim-cmp
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							library = {
								-- INFO: Add any library here for lua_ls
								-- vim.fn.expand("/usr/share/xmake/includes/"),
								vim.fn.expand("/home/theo/Desktop/xmake-luals-addon/"),
							},
						},
					},
				},
			})
			require("lspconfig").clangd.setup({ capabilities = capabilities })
			require("lspconfig").verible.setup({
				capabilities = capabilities,
				cmd = { "verible-verilog-ls", "--rules_config_search" },
			})
		end,
		setup = {
			metals = function(_, opts)
				local metals = require("metals")
				local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
				metals_config.on_attach = LazyVim.has("nvim-dap") and metals.setup_dap or nil

				local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "scala", "sbt" },
					callback = function()
						metals.initialize_or_attach(metals_config)
					end,
					group = nvim_metals_group,
				})
				return true
			end,
		},
	},
}
