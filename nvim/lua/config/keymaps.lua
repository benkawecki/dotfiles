-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Down>", "<NOP>")
vim.keymap.set("n", "<Up>", "<NOP>")
vim.keymap.set("n", "<Left>", "<NOP>")
vim.keymap.set("n", "<Right>", "<NOP>")

-- Search and Scroll preffered implementation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- double escape to leave highlight mode
vim.keymap.set("n", "<Esc><Esc>", ":noh<return><Esc>")
