require("config.config")
require("config.gui")

-- Plugin management via built-in vim.pack
vim.pack.add({
  -- Theme
  "https://github.com/Mofiqul/dracula.nvim",

  -- Statusline
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- Completion
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.10.2" },

  -- Fuzzy finder
  "https://github.com/ibhagwan/fzf-lua",

  -- Tmux navigation
  "https://github.com/christoomey/vim-tmux-navigator",

  -- Diagnostics panel
  "https://github.com/folke/trouble.nvim",

  -- LSP configs
  "https://github.com/neovim/nvim-lspconfig",
})

-- Theme
vim.cmd([[colorscheme dracula]])

-- Lualine
require("lualine").setup({
  options = { theme = "dracula" },
})

-- Fzf-lua
require("fzf-lua").setup({
  fzf_colors = true,
  keymap = {
    builtin = {
      ["<c-l>"] = "preview-down",
      ["<c-h>"] = "preview-up",
    },
  },
})
require("fzf-lua").register_ui_select()

-- Trouble
require("trouble").setup({})

-- Blink completion
require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
  },
  completion = {
    documentation = { auto_show = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- Fzf keymaps
local map = vim.keymap.set
map("n", "sg", "<cmd>FzfLua git_files<CR>", { desc = "Git Files" })
map("n", "st", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "sm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
map("n", "sf", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
map("n", "s/", "<cmd>FzfLua live_grep_resume<CR>", { desc = "Live Grep" })

-- Trouble keymaps
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Defs/Refs" })

-- Tmux navigator keymaps
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

-- LSP (loaded after vim.pack)
require("config.lsp")
