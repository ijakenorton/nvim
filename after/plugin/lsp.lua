local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['gopls'] = { 'go' },
        ['emmet_language_server'] = {
            'html'
        },
        ['jsonls'] = { 'json' }
    }
})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<C-.>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)
lsp.setup()
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require('lspconfig').tsserver.setup({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        }
    }
})


local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
        ---
        -- you can add other stuff here....
        ---
    end,
    sources = {
        -- Replace these with the tools you have installed
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
    }
})


lsp.setup_servers({ 'gopls' })
vim.diagnostic.config({
    virtual_text = true
})
--autosave for eslint

-- local function eslintFixAll()
--     vim.cmd("EslintFixAll")
-- end

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
--     callback = eslintFixAll,
-- })
local function eslintFixAll()
    -- Get the current buffer's file type
    local filetype = vim.bo.filetype
    -- Check if the filetype is one of the specified types
    if filetype == "javascript" or  filetype == "typescript"  then
        -- Run EslintFixAll if the filetype matches
        vim.cmd("EslintFixAll")
    end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",  -- Apply to all files
    callback = eslintFixAll,
})








