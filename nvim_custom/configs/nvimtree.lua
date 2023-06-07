local options = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    custom = {"node_modules", "__pycache__", ".DS_Store"},
  },
}

return options
