return {
        "akinsho/bufferline.nvim",
        keys = {
                {mode = "n", "L", "<cmd>bnext<CR>", desc = "Buffer next"},
                {mode = "n", "H", "<cmd>bprevious<CR>", desc = "Buffer previous"},
        },
        config = function()
                require("bufferline").setup({})
        end,
}
