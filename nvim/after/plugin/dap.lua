local dap = require('dap')

-- Node.js debug adapter configuration
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}

-- Debug configurations for Node.js
dap.configurations.typescript = {
    {
        type = 'node2',
        request = 'launch',
        name = 'Launch Node.js program',
        program = '${file}',
        cwd = '${workspaceFolder}',
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        type = 'node2',
        request = 'attach',
        name = 'Attach to Node.js process',
        processId = require 'dap.utils'.pick_process,
        cwd = '${workspaceFolder}',
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
}
local dapui = require("dapui")
dapui.setup()

-- Automatic opening/closing of nvim-dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
-- local dap = require("dap")


-- dap.adapters['pwa-node'] = {
--     type = "server",
--     host = "127.0.0.1",
--     port = 9229,
--     executable = {
--         command = "js-debug-adapter",
--     }
-- }

-- for _, language in ipairs { "typescript", "javascript" } do
--     dap.configurations[language] = {
--         {
--             type = "pwa-node",
--             request = "launch",
--             name = "Launch file",
--             program = "${file}",
--             cwd = "${workspaceFolder}",
--             runtimeExecutable = "node",
--         },
--     }
-- end
