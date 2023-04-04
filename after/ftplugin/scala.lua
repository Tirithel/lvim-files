-- lvim.keys.normal_mode["<Leader>m"] = "<cmd>Telescope metals commands<CR>"
print "hello scala!"
-- lvim.builtin.which_key.mappings["m"] = { "<cmd>Telescope metals commands<CR>", "Metals Commands" }
vim.keymap.set("n", "<leader>m", "<cmd>Telescope metals commands<CR>")

vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", ",", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- vim.keymap.set("n", ",", "<cmd>CodeActionMenu<CR>")
