return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',
    opts = {},

    config = function()
      require('blink.cmp').setup {
        keymap = { preset = 'default' },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono',
        },
        signature = { enabled = true },

        sources = {
          completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
          },

          providers = {
            markdown = { name = 'RenderMarkdown', module = 'render-markdown.integ.blink' },
          },
        },
      }
    end,
  },
}
