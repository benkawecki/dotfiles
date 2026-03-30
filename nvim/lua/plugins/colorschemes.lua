return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- Define 256-color overrides using Kanagawa's palette colors
			local function apply_256_colors()
				require("kanagawa").setup({
					colors = {
						palette = {
							-- Override specific palette colors to match 256-color approximation
							sumiInk3 = "#262626", -- Darker background (was #1F1F28)
							sumiInk4 = "#303030", -- Match gutter
							fujiGray = "#6c6c6c", -- Comments
							oldWhite = "#d7d7af", -- Variables/identifiers
							springGreen = "#87af5f", -- Strings (was #98BB6C)
							crystalBlue = "#7ea3c7", -- Functions
							sakuraPink = "#d75f87", -- Keywords
							carpYellow = "#d7d787", -- Constants/numbers
							surimiOrange = "#ffaf5f", -- Decorators/builtins
							springViolet1 = "#8686ae", -- Conditionals/loops
							peachRed = "#ff5f5f", -- Exceptions/special keywords
							oniViolet2 = "#AFAFD4", -- parameter
							oniViolet = "#8787AC", -- statement keyword
							boatYellow2 = "#AFAF69", -- operator/regex
							katanaGray = "#767676", -- deprecated
							springViolet2 = "#AFAFD4", -- punct
							springBlue = "#8FAED3", -- special1
							waveRed = "#C86686", -- special2/preproc
							-- waveAqua2 = "", -- type

							-- UI colors
							sumiInk0 = "#1C1C1C", -- bg_m3, float bg
							sumiInk1 = "#1C1C1C", -- bg_dim, bg_m2
							sumiInk2 = "#1C1C1C", -- bg_m1
							-- sumiInk4 = "#303030", -- bg_gutter, bg_p1
							sumiInk5 = "#3A3A3A", -- bg_p2
							sumiInk6 = "#5F5F5F", -- nontext, whitespace, fg_border
							fujiWhite = "#D7D7B3", -- fg, pmenu fg
							waveBlue1 = "#303030", -- fg_reverse, bg_visual, pmenu bg
							waveBlue2 = "#4E4E4E", -- bg_search, pmenu bg_sel

							-- VCS/Git colors
							autumnGreen = "#87875F", -- vcs added
							autumnRed = "#D75F5F", -- vcs removed
							autumnYellow = "#D7AF5F", -- vcs changed

							-- Diff colors
							winterGreen = "#303030", -- diff add
							winterRed = "#303030", -- diff delete
							winterBlue = "#262626", -- diff change
							winterYellow = "#444444", -- diff text

							-- Diagnostic colors
							samuraiRed = "#D70000", -- diag error, term bright red
							roninYellow = "#FFAF5F", -- diag warning
							dragonBlue = "#5F8787", -- diag info
							waveAqua1 = "#5F8787", -- diag hint, term cyan
							waveAqua2 = "#87AFAF",
						},
					},
				})
				vim.cmd.colorscheme("kanagawa")
			end

			-- Apply 256-color palette by default
			apply_256_colors()

			-- Create user commands

			vim.api.nvim_create_user_command("Kanagawa256", apply_256_colors, {
				desc = "Apply 256-color Kanagawa palette (darker colors)",
			})

			vim.api.nvim_create_user_command("KanagawaOriginal", function()
				require("kanagawa").setup({})
				vim.cmd.colorscheme("kanagawa")
				vim.notify("Restored original Kanagawa colors", vim.log.levels.INFO)
			end, { desc = "Restore original Kanagawa colors" })
		end,
	},
	-- -- Configure LazyVim to use the colorscheme
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "kanagawa", -- Name of the colorscheme
	-- 	},
	-- },

	-- {
	-- 	"wittyjudge/gruvbox-material.nvim",
	-- 	priority = 1000,
	-- 	-- init = function()
	-- 	-- 	vim.cmd.colorscheme("gruvbox-material")
	-- 	-- end,
	-- },
	-- { -- You can easily change to a different colorscheme.
	-- 	-- Change the name of the colorscheme plugin below, and then
	-- 	-- change the command in the config to whatever the name of that colorscheme is.
	-- 	--
	-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- 	-- init = function()
	-- 	-- 	-- Load the colorscheme here.
	-- 	-- 	-- Like many other themes, this one has different styles, and you could load
	-- 	-- 	-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 	-- 	vim.cmd.colorscheme("tokyonight-night")
	-- 	--
	-- 	-- 	-- You can configure highlights by doing something like:
	-- 	-- 	vim.cmd.hi("Comment gui=none")
	-- 	-- end,
	-- },
}
