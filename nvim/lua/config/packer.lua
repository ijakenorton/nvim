local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local status, packer = pcall(require, "packer")
if not status then
    return
end
return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }

    }
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("christoomey/vim-tmux-navigator")
    use("szw/vim-maximizer")
    -- use { "kyazdani42/nvim-tree.lua", config = [[require('config.nvim-tree')]] }
    -- use("nvim-tree/nvim-web-devicons")
    -- use("nvim-tree/nvim-web-devicons")
    use {
        "folke/trouble.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
    -- use('rcarriga/nvim-notify')
    -- use('dmmulroy/tsc.nvim')
    use {
        "nvim-tree/nvim-tree.lua",
    }
    use { "ellisonleao/gruvbox.nvim" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    --autoclosing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use('theprimeagen/harpoon')
    use('ThePrimeagen/vim-be-good')
    use('mbbill/undotree')
    use('jose-elias-alvarez/null-ls.nvim')
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
    use('tpope/vim-fugitive')
    use('tpope/vim-commentary')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim',
                opts = {
                    ensure_installed = {
                        "eslint_d",
                        "js-debug-adapter",
                        "prettier_d",
                        "tsserver",
                    }
                }
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('jayp0521/mason-null-ls.nvim')
    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")
    use('Aasim-A/scrollEOF.nvim')
    if packer_bootstrap then
        require("packer").sync()
    end
end)
