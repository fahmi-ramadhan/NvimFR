return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Function to check if a file is binary based on extension
        local function is_binary_file(filename)
            local binary_extensions = {
                -- Images
                "png", "jpg", "jpeg", "gif", "bmp", "tiff", "webp", "svg", "ico",
                -- Documents
                "pdf", "doc", "docx", "ppt", "pptx", "xls", "xlsx", "odt", "ods", "odp",
                -- Archives
                "zip", "rar", "7z", "tar", "gz", "bz2", "xz",
                -- Media
                "mp3", "mp4", "avi", "mkv", "mov", "wmv", "flv", "webm", "m4v", "m4a", "wav", "flac",
                -- Executables
                "exe", "msi", "dmg", "pkg", "deb", "rpm", "appimage",
                -- Others
                "bin", "dat", "db", "sqlite", "sqlite3"
            }

            local ext = filename:match("%.([^%.]+)$")
            if not ext then return false end

            ext = ext:lower()
            for _, binary_ext in ipairs(binary_extensions) do
                if ext == binary_ext then
                    return true
                end
            end
            return false
        end

        -- Custom function to open files
        local function open_file(node)
            local abs_path = node.absolute_path
            local filename = node.name

            if is_binary_file(filename) then
                -- Use xdg-open for binary files
                vim.fn.jobstart({ "xdg-open", abs_path }, { detach = true })
            else
                -- Use default nvim-tree behavior for text files
                local api = require("nvim-tree.api")
                api.node.open.edit(node)
            end
        end

        -- Custom on_attach function for key mappings
        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- Default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Override the default open action
            vim.keymap.set('n', '<CR>', function()
                local node = api.tree.get_node_under_cursor()
                if node then
                    open_file(node)
                end
            end, opts('Open'))

            -- Also override 'o' key
            vim.keymap.set('n', 'o', function()
                local node = api.tree.get_node_under_cursor()
                if node then
                    open_file(node)
                end
            end, opts('Open'))

            -- Add a specific keymap for forcing xdg-open (useful for any file)
            vim.keymap.set('n', 'gx', function()
                local node = api.tree.get_node_under_cursor()
                if node then
                    vim.fn.jobstart({ "xdg-open", node.absolute_path }, { detach = true })
                end
            end, opts('Open with system default'))

            -- Toggle gitignore filter
            vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignored'))
        end

        require("nvim-tree").setup {
            on_attach = on_attach,
            renderer = {
                highlight_git = true,
            },
        }

        -- toggle file tree
        vim.keymap.set("n", "<C-b>", "<cmd> NvimTreeToggle <CR>", {})
        -- focus
        vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", {})
    end,
}
