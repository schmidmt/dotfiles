Plug 'mhartington/oceanic-next', { 'as': 'OceanicNext' }

augroup ColorSchemeOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme OceanicNext
augroup end
