local status, packer = pcall(require, "packer")

-- AUTOMATION PACKER SETUP
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if not status then print('Packer not install') end

if (vim.fn.empty(vim.fn.glob(install_path)) > 0) then
    print('Installing packer...')
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
    print('Done.')

    vim.cmd('packadd packer.nvim')
    install_plugins = true
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- THEMES
    use 'ellisonleao/gruvbox.nvim'
    use 'joshdick/onedark.vim'
    use 'folke/tokyonight.nvim'
    use 'chriskempson/base16-vim'
    use 'metalelf0/jellybeans-nvim'

    -- ICONS
    use { 'kyazdani42/nvim-web-devicons', opt = true }
    use 'ryanoasis/vim-devicons'

    -- INDICATIONS
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- FILE SEARCH
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    -- LSP AND AUTOCOMPLETE
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    if install_plugins then
        require('packer').sync()
    end
end)

if install_plugins then
    print '=================================='
    print '    Plugins will be installed.'
    print '      After you press Enter'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end
