-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-a>", "<C-w><C-h>", { noremap = true, desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-c>", "<C-w><C-l>", { noremap = true, desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-e>", "<C-w><C-j>", { noremap = true, desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-i>", "<C-w><C-k>", { noremap = true, desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>Y", 'gg"+yG', { noremap = true, desc = "Yank file" })

vim.keymap.set("v", "E", ":m '>+1<cr>gv=gv", { noremap = true })
vim.keymap.set("v", "I", ":m '<-2<cr>gv=gv", { noremap = true })

-- require('which-key').add { '<leader>m', desc = 'Misc' }
