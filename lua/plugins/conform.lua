return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
				},
				formatters = {
					formatters = {
						black = {
							timeout_ms = 5000, -- Increase timeout to 5 seconds
							prepend_args = { "--fast", "--line-length", "88" },
						},
						isort = {
							timeout = 5000, -- 5 seconds
							prepend_args = { "--profile", "black" }, -- Make isort compatible with black
						},
					},
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
