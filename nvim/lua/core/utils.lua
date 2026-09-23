local M = {}

-- Returns the current line number(s)
-- ex. `L77`, `L77-L79`
M.getLineOrRange = function()
	local mode = vim.api.nvim_get_mode().mode
	local start_line, end_line

	if mode:match("[vV]") or mode == "\22" then -- visual, visual-line, visual-block
		start_line = vim.fn.line("'<")
		end_line = vim.fn.line("'>")
	else
		start_line = vim.fn.line(".")
		end_line = start_line
	end

	-- normalize order
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	if start_line == end_line then
		return string.format("L%d", start_line)
	else
		return string.format("L%d-L%d", start_line, end_line)
	end
end

M.copyFilePathAndLineNumber = function()
	local current_file = vim.fn.expand("%:p")
	local current_line = M.getLineOrRange()
	local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")

	if is_git_repo then
		local current_repo = vim.fn.systemlist("git remote get-url origin")[1]
		-- TODO: allow for always using main branch
		local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

		-- Convert Git URL to GitHub web URL format.
		-- Allow for different github servers.
		current_repo = current_repo:gsub("^git@(.+):", "https://%1/")
		current_repo = current_repo:gsub("%.git$", "")

		-- Remove leading system path to repository root
		local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
		if repo_root then
			current_file = current_file:sub(#repo_root + 2)
		end

		local url = string.format("%s/blob/%s/%s#%s", current_repo, current_branch, current_file, current_line)
		vim.fn.setreg("+", url)
		print("Copied to clipboard: " .. url)
	else
		-- If not in a Git directory, copy the full file path
		vim.fn.setreg("+", current_file .. "#" .. current_line)
		print("Copied full path to clipboard: " .. current_file .. "#" .. current_line)
	end
end

return M
