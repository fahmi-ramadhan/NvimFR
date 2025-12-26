return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            -- Disable Copilot for all filetypes by default
            filetypes = {
                ["*"] = false,

                javascript = true,
                typescript = true,
                typescriptreact = true,
                javascriptreact = true,
                json = true,
                yaml = true,
                markdown = true,
                vim = true,
                lua = true,
                python = true,
                html = true,
                css = true,
                scss = true,
                java = true,
                tex = true,
                dart = true,
                php = true,
                vue = true,
                cpp = true,
            },

            suggestion = {
                enabled = true,
                auto_trigger = true,

                -- This replaces `copilot_no_tab_map = true`
                keymap = {
                    accept = "<C-j>", -- same as your old mapping
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },

            panel = {
                enabled = false, -- matches copilot.vim default behavior
            },
        })
    end,
}
