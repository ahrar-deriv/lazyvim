-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("neoscroll").setup()
vim.opt.spell = true
vim.cmd(":Copilot disable")
