local dap, dapui = require("dap"), require("dapui")

dapui.setup()

-- GOLANG
require("dap-go").setup()

-- NodeJS
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

-- Debug configurations
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "ts-node",
    runtimeArgs = {"--esm"},
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

-- dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Keymaps
vim.keymap.set("n", "<Leader>dx", function() dapui.close() end, { desc = "Close DAP UI" })
vim.keymap.set("n", "<Leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>dt", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint() end)
vim.keymap.set("n", "<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)