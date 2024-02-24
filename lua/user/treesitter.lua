local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
configs.setup {
}
