local keymap = vim.keymap
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- Remap space as leader key
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- split window
keymap.set("n", "<leader>_", "<C-w>v")
keymap.set("n", "<leader>-", "<C-w>s")

-- Cancel search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Resize with arrows
-- delta: 2 lines
keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-----------------
-- Insert mode --
-----------------
