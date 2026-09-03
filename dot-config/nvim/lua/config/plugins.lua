vim.pack.add({
  -- Theme
  "https://github.com/Mofiqul/dracula.nvim",

  -- Icons
  "https://github.com/echasnovski/mini.icons",

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

  -- Repeat plugin actions with .
  "https://github.com/tpope/vim-repeat",

  -- Surround (add/change/delete surroundings)
  "https://github.com/kylechui/nvim-surround",

  -- Jump anywhere with labels
  "https://github.com/folke/flash.nvim",

  -- Treesitter text objects (af/if = function, ac/ic = class, ]m/]c = next)
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",

  -- Auto-close/rename HTML & JSX tags
  "https://github.com/windwp/nvim-ts-autotag",

  -- Yazi file manager integration
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/mikavilpas/yazi.nvim",
})

-- Theme
vim.cmd([[colorscheme dracula]])

-- Lualine
require("lualine").setup({
  options = { theme = "dracula" },
})

-- Icons (setup + mock nvim-web-devicons so fzf-lua/etc. detect them)
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()

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

-- Surround (ys/cs/ds)
require("nvim-surround").setup({})

-- Flash (jump motions)
require("flash").setup({
  modes = {
    search = { enabled = false }, -- don't hijack / by default
  },
})

-- Treesitter text objects
require("nvim-treesitter-textobjects").setup()
vim.treesitter.query.add_directive("set!", function() end, { force = true }) -- needed for built-in TS

-- Text object select: af/if = function, ac/ic = class, aa/ia = parameter
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Around function" })
vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Inner function" })
vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Around class" })
vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Inner class" })
vim.keymap.set({ "x", "o" }, "aa", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end, { desc = "Around parameter" })
vim.keymap.set({ "x", "o" }, "ia", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end, { desc = "Inner parameter" })

-- Text object move: ]m/]M = next function start/end, ]c = next class
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })
vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function end" })
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "Prev function start" })
vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "Prev function end" })
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class" })
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "Prev class" })

-- Auto-close/rename HTML & JSX tags
require("nvim-ts-autotag").setup({})

-- Yazi file manager
require("yazi").setup({
  open_for_directories = true, -- use yazi instead of netrw for directories
})

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
