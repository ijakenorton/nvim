-- vim.api.nvim_set_keymap('n', '<Leader>', [[:execute 'mksession! ' . getcwd() . '/session.vim'<CR>]],
--     { noremap = true, silent = true })

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
