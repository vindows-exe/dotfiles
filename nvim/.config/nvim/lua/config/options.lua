-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Rechtschreibprüfung aktivieren
vim.opt.spell = true
-- Sprachen: Deutsch und Englisch gleichzeitig
vim.opt.spelllang = { "de", "en" }

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  pattern = "*",
  command = "checktime",
})
