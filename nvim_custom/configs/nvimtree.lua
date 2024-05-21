local options = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    custom = {"node_modules", "__pycache__", ".DS_Store", ".pytest_cache", ".elixir_ls", "_build"},
  },
}

return options
