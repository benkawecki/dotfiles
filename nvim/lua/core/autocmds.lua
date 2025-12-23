-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set the filetype to groovy for 'Jenkinsfile' files.
-- autocmd BufNewFile,BufRead *.ezt set filetype=html
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "Jenkinsfile" },
	desc = "Autoset type of Jenkinsfile to groovy",
	group = vim.api.nvim_create_augroup("ft-groovy", { clear = true }),
	callback = function()
		vim.api.nvim_command("set filetype=groovy")
	end,
})
