return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },

		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				python = { "ruff_format" },
				nix = { "alejandra" },
				tex = { "latexindent" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
			},
		},
	},
}
