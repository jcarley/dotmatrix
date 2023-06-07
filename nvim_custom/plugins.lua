local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensured_installed = {
        "rust_analyzer",
        "gopls",
        "goimports",
        "pyright",
        "black",
        "flake8",
        "isort",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspcustom"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local nvchad_table = require "plugins.configs.nvimtree"
      local dotmatrix_table = require "custom.configs.nvimtree"

      return vim.tbl_deep_extend("force", nvchad_table, dotmatrix_table)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

       -- programming languages
        "c",
        "go",
        "python",
        "dockerfile",
        "markdown",
        "ruby",
        "rust",

        -- config markup
        "yaml",
        "json",
        "toml"
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    init = function()
      require "custom.configs.null_ls"
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
}
return plugins
