local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    -- Add automatically appearing diagnostics
    vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

    require('lsp-format').on_attach(client)
end)


lsp.ensure_installed({
    'rust_analyzer',
    'tsserver',
    'eslint',
    'pyright',
    'html',
    'lua_ls',
})

--  Configure language servers
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require('lspconfig').rust_analyzer.setup({
    imports = {
        granularity = {
            group = "module",
        },
        prefix = "self",
    },
    cargo = {
        buildScripts = {
            enable = true,
        },
        features = "all",
    },
    procMacro = {
        enable = true
    },
})


lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

require('fidget').setup()
