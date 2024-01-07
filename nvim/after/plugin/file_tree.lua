local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- -- Make Nvim Tree thinner
    vim.api.nvim_set_keymap('n', '<C-->', ':NvimTreeResize -5<CR>', { noremap = true, silent = true })

    -- -- Make Nvim Tree wider
    vim.api.nvim_set_keymap('n', '<C-p>', ':NvimTreeResize +5<CR>', { noremap = true, silent = true })
    -- local api = require "nvim-tree.api"
end

vim.keymap.set('n', '<C-b>', ':NvimTreeOpen<cr>', { noremap = true, silent = true })
-- pass to setup along with your other options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    view = {
        width = 35,
    },
    renderer = {
        indent_width = 4,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        special_files = {},
        icons = {
            show = {
                file = false,
                git = false,
                modified = false,
                folder_arrow = false,
            },
            glyphs = {
                default = " ",
                folder = {
                    default = " ",
                    open = " ",
                    empty = " ",
                    empty_open = " ",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        severity = {
            min = vim.diagnostic.severity.INFO,
            max = vim.diagnostic.severity.ERROR,
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
-- config = function()
--      require("nvim-tree").setup({
--        filters = {
--          custom = { "\\.git$", "\\.pyc$", "__pycache__" },
--        },
--        renderer = {
--          special_files = {},
--          icons = {
--            show = {
--              folder_arrow = false,
--            },
--            glyphs = {
--              default = "",
--              folder = {
--                default = "",
--                open = "",
--                empty = "",
--                empty_open = "",
--              },
--            },
--          },
--        },
