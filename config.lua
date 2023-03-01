--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "catppuccin"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = " "
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "rust",
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim" },
  {
    "theprimeagen/harpoon",
    config = function()
    end
  },
  {
    "mbbill/undotree",
    config = function ()
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"},
    config = function ()
    end
  },

  { 'hrsh7th/vim-vsnip' },
  -- rust tools has some weird inlay glitches with lvim
  { 'simrat39/rust-tools.nvim' },
  { 'petertriho/nvim-scrollbar' },
  { 'nvim-treesitter/playground' },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  -- {
  --   "echasnovski/mini.map",
  --   branch = "stable",
  --   config = function()
  --     require('mini.map').setup()
  --     local map = require('mini.map')
  --     map.setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.diagnostic({
  --           error = 'DiagnosticFloatingError',
  --           warn  = 'DiagnosticFloatingWarn',
  --           info  = 'DiagnosticFloatingInfo',
  --           hint  = 'DiagnosticFloatingHint',
  --         }),
  --       },
  --       symbols = {
  --         encode = map.gen_encode_symbols.dot('4x2'),
  --       },
  --       window = {
  --         side = 'right',
  --         width = 20, -- set to 1 for a pure scrollbar :)
  --         winblend = 15,
  --         show_integration_count = false,
  --       },
  --     })
  --   end
  -- },
}
-- mini
-- lvim.autocommands = {
--   {
--     {"BufEnter", "Filetype"},
--     {
--       desc = "Open mini.map and exclude some filetypes",
--       pattern = { "*" },
--       callback = function()
--         local exclude_ft = {
--           "qf",
--           "NvimTree",
--           "toggleterm",
--           "TelescopePrompt",
--           "alpha",
--           "netrw",
--         }

--         local map = require('mini.map')
--         if vim.tbl_contains(exclude_ft, vim.o.filetype) then
--           vim.b.minimap_disable = true
--           map.close()
--         elseif vim.o.buftype == "" then
--           map.open()
--         end
--       end,
--     },
--   },
-- }

-- scrollbar
require("scrollbar").setup()

-- dashboard
local nvimbanner = {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
	"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "      ⠈   ⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "   ⢀      ⢠⣿⣿⣿⠈⠄ ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄⠄⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿   ",
	"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄ ⠄⢊⣿⣿⡏  ⢸⣿⣿⡇⠄⢀⣠⣄⣾    ",
	" ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀⠄⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
	" ⠙⠃   ⣼⣿⡟⠌ ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇ ⠛⠻⢷⣄ ",
	"     ▐⢻▄▄▄▄ .⠈⠻⣿⣿ ▌⣷▐▪⣿•⣿▌⠄▄⢿·.   ⠁",
	"    •█▌▐▀▄.▀▪⣶⣾⣿⣿▪█·███·██ ▐███▪   ",
	"    ▐█▐▐▐▀▀▪▄▄█▀▄▐█▐█▐█▐█ ▌▐▌▐█·   ",
	"    ██▐█▐█▄▄▐█▌.▐▌███▐███ ██▌▐█▌   ",
	"    ▀▀ █▪▀▀▀ ▀█▄▀. ▀ ▀▀▀▀  █▪▀▀▀   ",
}
lvim.builtin.alpha.dashboard.section.header = {
    type = "text",
    val = nvimbanner,
    opts = {
      position = "center",
      hl = "Label",
    },
  }

-- gitsigns
lvim.builtin.gitsigns.opts.signs = {
  add          = { hl = 'GitSignsAdd'   , text = 'A', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
	change       = { hl = 'GitSignsChange', text = 'M', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
	delete       = { hl = 'GitSignsDelete', text = 'D', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
	topdelete    = { hl = 'GitSignsDelete', text = 'D', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
	changedelete = { hl = 'GitSignsChange', text = 'D', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
}

-- debug
lvim.builtin.dap.active = true

-- keep cursor in the middle with search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- moves visual block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- dashboard
vim.keymap.set("n", "<leader>bs", "<cmd>Alpha<CR>")

-- settings
vim.opt.colorcolumn = "120"
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
