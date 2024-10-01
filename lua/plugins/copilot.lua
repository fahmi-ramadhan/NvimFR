return {
	"github/copilot.vim",
	config = function()
		-- General copilot settings
		vim.g.copilot_no_tab_map = true -- Prevents Copilot from taking over the <Tab> key
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Set <C-J> to accept Copilot suggestions

		-- Copilot can interfere with some other autocompletion and LSP functions,
		-- so you can fine-tune how and when it activates, based on your preferences.

		-- Example: enable copilot only for specific filetypes
		vim.g.copilot_filetypes = {
			["*"] = false, -- disable globally
			["javascript"] = true, -- enable only for these
			["typescript"] = true,
			["typescriptreact"] = true,
			["javascriptreact"] = true,
			["json"] = true,
			["yaml"] = true,
			["markdown"] = true,
			["vim"] = true,
			["lua"] = true,
			["python"] = true,
			["html"] = true,
			["css"] = true,
			["scss"] = true,
		}
	end,
}
