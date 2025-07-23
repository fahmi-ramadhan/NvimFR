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
                    "ts_ls",
                    "eslint",
                    "tailwindcss",
                    "jdtls",
                    "pyright",
                    "tflint",
                    "gopls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

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
            lspconfig.tflint.setup({})

            -- eslint setup
            lspconfig.eslint.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
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

            lspconfig.ts_ls.setup({
                on_attach = function(_, bufnr)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
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

            lspconfig.jdtls.setup({
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = true
                end,
            })

            lspconfig.pyright.setup({
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = true
                end,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

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
        end,
    },
}
