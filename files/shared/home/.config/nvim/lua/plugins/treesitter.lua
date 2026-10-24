return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter").install({
				"bash",
				"c",
				"cpp",
				"lua",
				"latex",
				"nix",
				"python",
				"rust",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
			})

			-- Enable Tree-sitter highlighting for supported buffers.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash",
					"c",
					"cpp",
					"lua",
					"latex",
					"nix",
					"python",
					"rust",
					"vim",
					"vimdoc",
					"html",
					"css",
					"javascript",
					"typescript",
				},
				callback = function(args)
					local ok = pcall(vim.treesitter.start, args.buf)
					if not ok then
						-- Parser may not be installed yet.
						return
					end
				end,
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"xml",
		},
		opts = {},
	},
}
