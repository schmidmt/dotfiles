-- [[ Lazy Config ]]

-- Install Lazy if it isn't present.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--[[

local plugins = {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  {
    'lukas-reineke/lsp-format.nvim',
    config = function()
      require("lsp-format").setup {}
    end
  },
  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup()
    end
  },
  -- use 'mfussenegger/nvim-jdtls'
  {
    "asiryk/auto-hlsearch.nvim",
    tag = "1.0.0",
    config = function()
      require('auto-hlsearch').setup()
    end
  },


  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
      })
    end
  },
  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter',
    },
  },

  {
    'm-demare/hlargs.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('hlargs').setup()
    end
  },
  'nvim-treesitter/playground',
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    "IndianBoy42/tree-sitter-just",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("tree-sitter-just").setup({ ["local"] = false })
    end
  },

  'folke/neodev.nvim',

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },


  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  "jamespeapen/Nvim-R",
}

--]]

require('lazy').setup 'schmidmt.plugins'
