return {
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup({
                                ui = {
                                        icons = {
                                                package_installed = "✓",
                                                package_pending = "➜",
                                                package_uninstalled = "✗"
                                        }
                                }
                        })
                end,
        },

        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                -- 确保安装，根据需要填写
                                ensure_installed = { "lua_ls", "c", "cpp", "verilog", },
                        })
                end,
        },


        {
                "neovim/nvim-lspconfig",
                config = function()
                        require("lspconfig").lua_ls.setup({})
                        require("lspconfig").clangd.setup({})
                        require("lspconfig").verible.setup({})
                end,
        },
}
