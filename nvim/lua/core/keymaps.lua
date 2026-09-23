-- Rebind the <ESC> key to be something more ergonomic
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jJ", "<Esc>")

-- Exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Preserve yank buffer when pasting in visual mode
vim.keymap.set("v", "p", '<cmd>let @v = @*<CR>"vp<cmd>let @* = @v<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Quickfix keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>h", "<cmd>cprev<CR>zz", { desc = "Go to prev quickfix" })
vim.keymap.set("n", "<leader>l", "<cmd>cnext<CR>zz", { desc = "Go to next quickfix" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Validation for json
vim.keymap.set("n", "<leader>vj", "<cmd>%!jq .<CR>", { desc = "[V]alidate [j]son" })
vim.keymap.set("n", "<leader>vy", "<cmd>%!yq .<CR>", { desc = "[V]alidate [y]aml" })

-- Change directory to the directory of the current file
vim.keymap.set("n", "<leader>~", "<cmd>cd %:p:h <CR>", { desc = "Change working directory to here" })

-- Keybinds to make split navigation easier. Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

local function debug_info()
	vim.notify("Hello, Neovim user!", vim.log.levels.INFO, { title = "My Keymap" })
end

vim.keymap.set("n", "<leader>p", debug_info)

local utils = require("core.utils")
-- Copy the current line number
vim.keymap.set({ "n", "v" }, "<leader>yln", utils.copyFilePathAndLineNumber)
