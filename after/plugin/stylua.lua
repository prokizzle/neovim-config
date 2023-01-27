local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>sl", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)
