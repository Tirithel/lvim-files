-- local rt = require("rust-tools")
local dap = require "dap"

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command =  vim.fn.stdpath "data" .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
}

-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
--   dap = {
--     adapter = dap.adapters.codelldb,
--   },
-- })
