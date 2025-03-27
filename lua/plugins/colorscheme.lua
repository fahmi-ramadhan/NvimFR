return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first,
    config = function()
        require("tokyonight").setup{
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        }
        vim.cmd.colorscheme("tokyonight")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}

