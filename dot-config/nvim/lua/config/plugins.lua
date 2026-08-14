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

  -- Key hint popup
  "https://github.com/folke/which-key.nvim",

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

-- Which-key
require("which-key").setup({})

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
