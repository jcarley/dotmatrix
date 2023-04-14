local ensure_packer = function()
    local fn = vim.fn
    -- The function fn.stdpath('data') resolves to ~HOME/.local/share/nvim
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- Utilities
    use 'nvim-lua/plenary.nvim' -- Common utilities

    -- Files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- Theme
    use("joshdick/onedark.vim")

    -- Productivity
    use("nvim-lualine/lualine.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use('akinsho/nvim-bufferline.lua')
    use('numToStr/Comment.nvim')


    -- Git
    use('tpope/vim-fugitive')
    use('dinhhuy258/git.nvim') -- For git blame & browse

    --
    -- Development
    --
    use "fatih/vim-go"

    -- LSP
    use 'hrsh7th/cmp-buffer'    -- nvim-cmp source for buffer words
    use 'onsails/lspkind-nvim'  -- vscode-like pictograms
    use 'hrsh7th/cmp-nvim-lsp'  -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'      -- Completion
    use 'folke/neodev.nvim'     -- Additional lua configuration, makes nvim stuff amazing!
    use 'neovim/nvim-lspconfig' -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'L3MON4D3/LuaSnip'
    use "lukas-reineke/lsp-format.nvim"

    -- They're coming for our jobs
    -- use('github/copilot.vim')

    -- Useful plugin to show you pending keybinds.
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

    -- Silly
    use("eandrju/cellular-automaton.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
