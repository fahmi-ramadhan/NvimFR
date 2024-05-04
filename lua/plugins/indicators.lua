  return {
    -- word usage highlighter
    {
        "RRethy/vim-illuminate",
        lazy = true,
        config = function()
            require("illuminate").configure({
                filetypes_denylist = {},
            })
        end,
    },

    -- jump to word indictors
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
            })

            vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#900043", bold = true, underline = true })
            vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#692047", underline = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = {
                    "*",
                },
                callback = function()
                    vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#900043", bold = true, underline = true })
                    vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#692047", underline = true })
                end,
            })
        end,
    },

    -- cursor movement highlighter
    "DanilaMihailov/beacon.nvim",

    -- highlight yanked region
    "machakann/vim-highlightedyank",

    -- suggest mappings
    {
        "folke/which-key.nvim",
        config = true,
    },
}
