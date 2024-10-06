return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					"html",
					"emmet_ls",
					"tsserver",
					"svelte",
					"eslint",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local null_ls = require("null-ls")

			local emmetCapabilities = vim.lsp.protocol.make_client_capabilities()
			emmetCapabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.emmet_ls.setup({
				capabilities = emmetCapabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"sass",
					"scss",
					"svelte",
					"typescriptreact",
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			})

			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.tailwindcss.setup({})

			-- ESLint setup
			lspconfig.eslint.setup({
				on_attach = function(bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			-- Prettier and other formatting tools
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier.with({
						filetypes = {
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"jsonc",
							"yaml",
							"markdown",
							"markdown.mdx",
							"graphql",
							"handlebars",
						},
						command = "prettier",
						args = function(params)
							return {
								"--stdin-filepath",
								vim.fn.fnamemodify(params.bufname, ":p"),
							}
						end,
					}),
					null_ls.builtins.formatting.stylua,
				},
			})

			-- Create an augroup for the autocommands
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- Set up autocommand for formatting on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			lspconfig.tsserver.setup({
				on_attach = function(client, bufnr)
					-- Disable tsserver formatting if you prefer to use Prettier
					client.server_capabilities.documentFormattingProvider = false

					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Add any other custom on_attach functionality here
				end,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
				flags = {
					debounce_text_changes = 150,
				},
			})

			lspconfig.svelte.setup({
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			lspconfig.gopls.setup({
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
			})

			-- Existing keymaps...
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<A-p>", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

			-- Add a keymap for manual formatting
			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
		end,
	},
}
