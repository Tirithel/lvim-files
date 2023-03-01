local rt = require 'rust-tools'
print("configuring for rust using rust-tools")
local opts = {
  tools = { -- rust-tools options
    runnables = {
      use_telescope = true,
    },

    debuggables = {
      use_telescope = true,
    },

    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = true,
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {
      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = true,
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    -- standalone = true,
    on_attach = function(_, bufnr)
      -- ih.on_attach(client, bufnr)
      vim.keymap.set(
        "n",
        "<C-space>",
        rt.hover_actions.hover_actions,
        { buffer = bufnr }
      )

      vim.keymap.set(
        "n",
        "<Leader>a",
        rt.code_action_group.code_action_group,
        { buffer = bufnr }
      )
    end,
  }, -- rust-analyzer options

  -- debugging stuff
  dap = {
    adapter = require 'dap'.adapters.codelldb
  },
}

rt.setup(opts)
