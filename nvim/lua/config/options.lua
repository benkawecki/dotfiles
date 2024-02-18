-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby

local opt = vim.opt

-- scrolling
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

-- indent
opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.smartindent = true
