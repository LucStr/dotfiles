-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})


return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        -- for telescope
        use('nvim-lua/plenary.nvim')

        -- for telescope live_grep
        use('BurntSushi/ripgrep')

        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------

        use({
            'goolord/alpha-nvim',
            config = function()
                require('alpha').setup(require('alpha.themes.startify').config)
            end,
        })

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use({
            'EdenEast/nightfox.nvim',
            config = function()
                require('LucStr.plugins.theme')
            end,
        })

        use({
            'nvim-lualine/lualine.nvim',
            config = function()
                require('LucStr.plugins.lualine')
            end,
        })

        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            'nvim-treesitter/nvim-treesitter',
            event = 'CursorHold',
            run = ':TSUpdate',
            config = function()
                require('LucStr.plugins.treesitter')
            end,
        })

        --------------------------
        -- Editor UI Niceties --
        --------------------------

        use({
            'norcalli/nvim-colorizer.lua',
            event = 'CursorHold',
            config = function()
                require('colorizer').setup()
            end,
        })

        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
               require('LucStr.plugins.indent')
            end,
        })

        use({
            'lewis6991/gitsigns.nvim',
            config = function()
                require('LucStr.plugins.gitsigns')
            end
        })
        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'kyazdani42/nvim-tree.lua',
            requires = {
              'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly', -- optional, updated every week. (see issue #1193),
            config = function()
                require('LucStr.plugins.fileexplorer')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('LucStr.plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })

        use({
            'ahmedkhalf/project.nvim',
            after = 'telescope.nvim',
            config = function()
                require('LucStr.plugins.project')
            end,
        })

        use({
            'numToStr/Navigator.nvim',
            config = function()
                require('Navigator').setup()
            end,
        })

        -------------------------
        -- Editing to the MOON --
        -------------------------

        use({
            'windwp/nvim-autopairs',
            config = function()
                require('LucStr.plugins.autopairs')
            end,
        })

        --------------
        -- Terminal --
        --------------
        
        use({
            'akinsho/toggleterm.nvim',
            config = function()
                require('LucStr.plugins.term')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------

        use({
            'neoclide/coc.nvim',
            branch='release',
            config = function()
                require('LucStr.plugins.lsp')
            end,
        })
        
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
