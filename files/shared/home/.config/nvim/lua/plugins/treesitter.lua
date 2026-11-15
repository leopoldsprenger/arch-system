return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local ts = require("nvim-treesitter")
			local parsers = {
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
			}

			ts.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo[args.buf].filetype
					local lang = vim.treesitter.language.get_lang(ft) or ft

					if pcall(vim.treesitter.start, args.buf, lang) then
						return
					end

					local available = require("nvim-treesitter.parsers")
					if available[lang] then
						ts.install({ lang }):await(function()
							pcall(vim.treesitter.start, args.buf, lang)
						end)
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
