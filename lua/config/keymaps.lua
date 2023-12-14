-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local keymap = vim.keymap.set
-- local opts = { silent = true }
-- keymap("n", "<leader>/", "gcc", opts)
-- keymap("x", "<leader>/", "gc", opts)
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
