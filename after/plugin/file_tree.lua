local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', '<C-<>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
    -- vim.keymap.set('n', '<C-<>', api.node.open.replace_tree_buffer(), { noremap = true, silent = true })
    -- -- Make Nvim Tree thinner
    vim.api.nvim_set_keymap('n', '<C-_>', ':NvimTreeResize -5<CR>', { noremap = true, silent = true })

    -- -- Make Nvim Tree wider
    vim.api.nvim_set_keymap('n', '<C-+>', ':NvimTreeResize +5<CR>', { noremap = true, silent = true })
    -- local api = require "nvim-tree.api"
end

-- pass to setup along with your other options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    view = {
        width = 35,
    },
    renderer = {
        icons = {
            web_devicons = {
                file = {
                    enable = false, -- Disables file icons
                    color = true,
                },
                folder = {
                    enable = false, -- Disables folder icons
                    color = true,
                },
            },
        },
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
