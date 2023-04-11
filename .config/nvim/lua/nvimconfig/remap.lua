vim.g.mapleader = "\\"

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>ev', ":e $MYVIMRC<CR>")
vim.keymap.set('n', '<leader>sv', ":so $MYVIMRC<CR>")
