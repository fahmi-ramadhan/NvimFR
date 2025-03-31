return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first,
    config = function()
        require("tokyonight").setup {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            on_colors = function(c)
                -- Because lualine broke stuff with the latest commit
                c.bg_statusline = c.none
            end,
            on_highlights = function(hl, c)
                -- TabLineFill is currently set to black
                hl.TabLineFill = {
                    bg = c.none,
                }
            end,
        }
        vim.cmd.colorscheme("tokyonight")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
