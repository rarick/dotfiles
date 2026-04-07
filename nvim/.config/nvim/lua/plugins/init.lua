return {
  { "junegunn/vim-easy-align" },
  { "tpope/vim-fugitive" },

  {
    "Mofiqul/dracula.nvim",
    opts = {
      colorscheme = "dracula",
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "dracula",
      },
    },
  },

  {
    "tomtom/tcomment_vim",
    keys = {
      { "gjj", "^g<c <bar> <c-_>2<c-_>b", desc = "Block comment" },
    },
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      fzf_colors = true,
      keymap = {
        builtin = {
          ["<c-l>"] = "preview-down",
          ["<c-h>"] = "preview-up",
        },
      },
    },
    keys = {
      { "sg", "<cmd>FzfLua git_files<CR>", desc = "Git Files" },
      { "st", "<cmd>FzfLua files<CR>", desc = "Find Files" },
      { "sm", "<cmd>FzfLua marks<CR>", desc = "Marks" },
      { "sf", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "s/", "<cmd>FzfLua live_grep_resume<CR>", desc = "Buffers" },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
