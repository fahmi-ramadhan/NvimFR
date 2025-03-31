# Fahmi's Neovim Configuration

This repository contains my personal Neovim configuration files

## Table of Contents

- [Structure](#structure)
- [Key Features](#key-features)
- [Plugin List](#plugin-list)
- [Key Mappings](#key-mappings)

## Structure

- `init.lua`: Main configuration file
- `lua/misc.lua`: Miscellaneous settings and key mappings
- `lua/plugins/`: Directory containing plugin configurations

## Key Features

- Lazy-loaded plugins for faster startup
- Custom color scheme (Tokyo Night) with transparency
- File explorer (NvimTree)
- Fuzzy finder (Telescope)
- Syntax highlighting and indentation (Treesitter)
- Status line (Lualine)
- Buffer line
- Git integration (Gitsigns, Neogit)
- Code completion (nvim-cmp, Copilot)
- Snippet support (LuaSnip)
- LSP support with various language servers
- Markdown preview
- Terminal integration (Nvterm)
- Auto-formatting and linting
- LaTeX support (VimTex)
- AI chat integration (Avante)
- Better UI for messages, cmdline and the popupmenu (💥Noice)
- And more!

## Key Mappings

### General

- Leader key: `Space`
- `<C-h/j/k/l>`: Navigate between windows
- `<Tab>/<S-Tab>`: Cycle through buffers
- `<leader>x`: Close buffer
- `<leader>/`: Toggle comment
- `<leader>n`: Toggle line numbers
- `<leader>rn`: Toggle relative line numbers
- `<C-d>/<C-u>`: Scroll down/up (centered)
- `J`: Join lines (keeping cursor position)

### File Explorer (NvimTree)

- `<C-b>`: Toggle file explorer
- `<leader>e`: Focus file explorer

### Terminal

- `<A-i/h/v>`: Toggle floating/horizontal/vertical terminal

### Fuzzy Finder (Telescope)

- `<leader>ff`: Find files
- `<leader>fw`: Live grep
- `<leader>fb`: Search buffers
- `<leader>fh`: Search help tags
- `<leader>fa`: Find all files (including hidden)
- `<leader>fz`: Fuzzy find in current buffer

### Git

- `<leader>gh`: Preview hunk inline (Gitsigns)
- `<leader>gH`: Preview hunk in floating window (Gitsigns)
- `<leader>gb`: Toggle line blame (Gitsigns)
- `<leader>gt`: Open Neogit

### LSP

- `K`: Hover information
- `gd`: Go to definition
- `gD`: Go to declaration
- `gi`: Go to implementation
- `<leader>ca`: Code action
- `<C-p>`: Go to previous diagnostic
- `<A-p>`: Go to next diagnostic
- `<F2>`: Rename symbol
- `<C-k>`: Signature help
- `<leader>wa`: Add workspace folder
- `<leader>wr`: Remove workspace folder
- `<leader>wl`: List workspace folders
- `<leader>D`: Type definition
- `gr`: Find references
- `<leader>E`: Show diagnostics in float window
- `<leader>q`: Set location list
- `<leader>fm`: Format buffer

### Completion (nvim-cmp)

- `<C-9>`: Select previous item
- `<C-0>`: Select next item
- `<C-d>`: Scroll docs down
- `<C-f>`: Scroll docs up
- `<C-Space>`: Complete
- `<C-e>`: Close completion menu
- `<CR>`: Confirm completion
- `<Tab>`: Next completion or expand snippet
- `<S-Tab>`: Previous completion or jump to previous snippet placeholder

### Snippets (LuaSnip)

- `<Tab>`: Expand or jump to next placeholder
- `<S-Tab>`: Jump to previous placeholder

### Copilot

- `<C-J>`: Accept Copilot suggestion

### LaTeX (vimtex)

- `<leader>ll`: Compile LaTeX document
- `<leader>lv`: View LaTeX PDF
- `<leader>lk`: Kill LaTeX compiler
- `<leader>le`: Show errors
- `<leader>lw`: Show warnings
- `<leader>lo`: Show log
- `<leader>lg`: Show log and errors
