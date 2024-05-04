return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdatel",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "lua",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "svelte",
                "go",
                "json",
                "python",
                "java",
                "rust",
                "yaml",
                "cpp",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true
        })
    end
}
