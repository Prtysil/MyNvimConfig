return {
        "nvim-treesitter/nvim-treesitter",
	dependencies = { "p00f/nvim-ts-rainbow" },
        config = function()
                require("nvim-treesitter.configs").setup({
                        -- Add which language you want
                        ensure_installed = { "c", "cpp", "lua", "vim", "markdown", "markdown_inline", "verilog", "python", "json", "javascript" },
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
                        }
                })
        end,
}
