local status_ok, gen = pcall(require, "gen")
if not status_ok then
  return
end
vim.keymap.set('v', '<leader>-', ':Gen<CR>')
vim.keymap.set('n', '<leader>-', ':Gen<CR>')


