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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        }
      })
    end
  }
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        opleader = {
          line = "gc",
          block = "gb",
        },
        mappings = {
          basic = true,
          extra = true,
        }
      })
    end
  }
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'mbbill/undotree'
  use 'lukas-reineke/lsp-format.nvim'
  use {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup()
    end
  }
  use 'mfussenegger/nvim-jdtls'

  use({
    "asiryk/auto-hlsearch.nvim",
    tag = "1.0.0",
    config = function()
      require('auto-hlsearch').setup()
    end
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    -- config = function() require("schmidmt.config.lsp").setup() end,
  }

  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('hlargs').setup()
    end
  }
  use({ "L3MON4D3/LuaSnip", tag = "v1.*" })

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.*',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      pcall(require('telescope').load_extension, 'fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fr', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use 'j-hui/fidget.nvim'
  use 'folke/neodev.nvim'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })





  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
