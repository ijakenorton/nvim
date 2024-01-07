
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>',
            { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() })
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local session_file = vim.fn.getcwd() .. '/session.vim'
        if vim.fn.filereadable(session_file) == 1 then
            vim.cmd('source ' .. session_file)
            vim.cmd('syntax on')
            -- Close and reopen Nvim Tree to ensure it loads correctly
            vim.cmd('NvimTreeClose')
            vim.cmd('NvimTreeOpen')
            -- vim.defer_fn(function() vim.cmd('NvimTreeOpen') end, 100)
        end
    end
})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
        local session_file = vim.fn.getcwd() .. '/session.vim'
        vim.cmd('mksession! ' .. session_file)
    end
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
    pattern = "*",
    callback = function()
        vim.cmd('nnoremap <CR> <CR>')
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "quickfix",
    callback = function()
        vim.cmd('nnoremap <CR> <CR>')
    end
})

