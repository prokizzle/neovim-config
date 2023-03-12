local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.oldfiles, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>tt", function()
	require("telescope-tabs").list_tabs()
end)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>tr", function()
	builtin.grep_string({ search = vim.call("expand", "<cword>") })
end)
vim.api.nvim_set_keymap(
	"n",
	"<leader>tf",
	"<Cmd>lua require('telescope').extensions.frecency.frecency({workspace = 'CWD'})<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>te", "<Cmd>Telescope emoji<cr>")
vim.keymap.set("n", "<leader>ta", "<Cmd>Telescope adjacent<cr>")

vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser", { noremap = true })

require("telescope").setup({
	extensions = {
		coc = {
			theme = "ivy",
			prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
		},
	},
})

require("telescope").load_extension("adjacent")
-- require("telescope").load_extension("coc")
require("telescope").load_extension("emoji")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("frecency")
require("telescope").load_extension("fzy_native")
