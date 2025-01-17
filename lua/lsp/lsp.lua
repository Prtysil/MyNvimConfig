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
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- More details see https://github.com/hrsh7th/nvim-cmp
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
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
			require("lspconfig").clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			require("lspconfig").verible.setup({
				on_attach = on_attach,
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
