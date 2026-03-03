return {
  --{
  --  'folke/tokyonight.nvim',
  --  lazy = false,
  --  priority = 1000,
  --  opts = {},
  --  config = function()
  --    vim.cmd.colorscheme 'tokyonight-storm'
  --  end,
  --},
  {
    '0xstepit/flow.nvim',
    lazy = false,
    priority = 1000,
    tag = 'v1.0.0',
    opts = {
      -- Your configuration options here.
    },
    config = function(_, opts)
      require('flow').setup(opts)
      vim.cmd 'colorscheme flow'
    end,
  },
}
