
vim.g.mapleader = " "
vim.cmd("set clipboard+=unnamedplus")

-- -- vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set('n', '<leader>es', ':EslintFixAll<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf()})
    end
})

vim.keymap.set('n', '<C-b>', ':NvimTreeOpen<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':belowright10 split | terminal<cr>')
--vim.keymap.set("n", "<leader>pv", vim.cmd.lexplore)
vim.keymap.set("i", "<tab>", "")


vim.keymap.set("v", "<C-J>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")
-- vim.api.nvim_exec('unmap <c-j>', false)
vim.api.nvim_set_keymap('i', '<Tab>', '<Tab>', {noremap = true, silent = true})
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--helper functions with brackets and quotes
vim.api.nvim_set_keymap('i', '(', '()<Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '(<CR>', '()<Left><CR><Esc>O', {noremap = true})

vim.api.nvim_set_keymap('i', '"', '""<Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '"<CR>', '""<Left><CR><Esc>O', {noremap = true})

vim.api.nvim_set_keymap('i', '`', '``<Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '`<CR>', '``<Left><CR><Esc>O', {noremap = true})

vim.api.nvim_set_keymap('i', "'", "''<Left>", {noremap = true})
vim.api.nvim_set_keymap('i', "'<CR>", "''<Left><CR><Esc>O", {noremap = true})

vim.api.nvim_set_keymap('i', '{', '{}<Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '{<CR>', '{}<Left><CR><Esc>O', {noremap = true})

vim.api.nvim_set_keymap('i', '[', '[]<Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '[<CR>', '[]<Left><CR><Esc>O', {noremap = true})

vim.api.nvim_set_keymap('i', '<', '<><Left>', {noremap = true})
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("c", "W", ":w", {silent = true})
vim.keymap.set("n", "<leader><leader>", function()
vim.cmd("so")
end)







