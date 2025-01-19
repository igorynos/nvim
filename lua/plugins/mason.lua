return {
	-- Mason для управления инструментами
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- Mason LSP Config для установки LSP-серверов
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- Список серверов LSP для автоматической установки
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "clangd" },
			})
		end,
	},
	-- Mason Null-LS для установки линтеров и форматтеров
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				-- Список линтеров и форматтеров для автоматической установки
				ensure_installed = { "black", "flake8", "isort", "prettier", "eslint" },
				automatic_installation = true,
			})
		end,
	},
	-- Null-LS для интеграции линтеров и форматтеров с Neovim
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Форматтеры
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.prettier,
					-- Линтеры
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.diagnostics.eslint,
				},
			})
		end,
	},
}
