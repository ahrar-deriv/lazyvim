-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"
  vim.opt.linespace = 0
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
require("config.lazy")
vim.opt.spell = true
