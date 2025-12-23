return {
	-- how keybindings
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
				["<leader>m"] = { name = "[M]arkdown", _ = "which_key_ignore" },
				["<leader>v"] = { name = "[V]alidate", _ = "which_key_ignore" },
			})
		end,
	},

	-- preview markdown files in browser
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", "<Cmd>MarkdownPreview<CR>", { desc = "[M]arkdown [P]review" })
			vim.keymap.set("n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>", { desc = "[M]arkdown Preview [S]top" })
		end,
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ -- file exploration in nvim
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ reveal = true })
					-- require("neo-tree.command").execute({ toggle = true })
				end,
				{ desc = "NeoTree reveal" },
			},
		},
		opts = {
			close_if_last_window = true,
			filesystem = {
				window = {
					mappings = {
						["<leader>fe"] = "close_window",
					},
				},
			},
		},
	},
}
