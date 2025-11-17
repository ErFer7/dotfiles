-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.loaded
-- Add any additional keymaps here

-- Move line/selection up
vim.keymap.set("n", "<M-Up>", ":m -2<CR>==")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")

-- Move line/selection down
vim.keymap.set("n", "<M-Down>", ":m +1<CR>==")
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")

-- Copy line/selection up
vim.keymap.set("n", "<M-C-Up>", ":t .-1<CR>==")
vim.keymap.set("v", "<M-C-Up>", ":'<,'>t '<-1<CR>gv=gv")

-- Copy line/selection down
vim.keymap.set("n", "<M-C-Down>", ":t .<CR>==")
vim.keymap.set("v", "<M-C-Down>", ":'<,'>t '><CR>gv=gv")

-- Save file
vim.keymap.set({ "n", "v" }, "", ":w")

-- Copy and paste for normal people
vim.keymap.set({ "n", "v" }, "", '"+y')

-- Select all
vim.keymap.set({ "n", "v" }, "", "ggVG")
