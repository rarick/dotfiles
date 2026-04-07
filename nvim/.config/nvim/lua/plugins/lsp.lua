return {
  { "mason-org/mason.nvim", opts = {} },
  { "neovim/nvim-lspconfig", lazy = false },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",        -- bash
        "cssls",         -- css
        "dockerls",      -- dockerfile
        "gopls",         -- go
        "html",          -- html
        "jdtls",         -- java
        "jsonls",        -- json
        "lua_ls",        -- lua
        "marksman",      -- markdown
        "pyright",       -- python
        "rust_analyzer", -- rust
        "smithy_ls",     -- smithy
        "ts_ls",         -- typescript / javascript
        "yamlls",        -- yaml
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<c-j>"] = cmp.mapping.select_next_item(),
            ["<c-k>"] = cmp.mapping.select_prev_item(),
            ["<c-l>"] = cmp.mapping.scroll_docs(1),
            ["<c-h>"] = cmp.mapping.scroll_docs(-1),
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
          }),
        sources = cmp.config.sources({
            { name = "buffer" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "path" },
          }),
      }
    end,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  {
    "L3MON4D3/LuaSnip",
    opts = {
      selection_change_events = { "InsertEnter" },
      enable_autosnippets = true,
    },
    keys = function()
      local luasnip = require("luasnip")
      local function move_choice(n)
        if luasnip.choice_active() then
          luasnip.change_choice(n)
        end
      end

      return {
        { "<c-j>", function() move_choice(1) end,mode = { "i", "s" }, silent = true, },
        { "<c-k>", function() move_choice(-1) end,mode = { "i", "s" }, silent = true, },
        { "<c-l>", function() luasnip.jump(1) end, mode = { "i", "s" }, silent = true },
        { "<c-h>", function() luasnip.jump(-1) end, mode = { "i", "s" }, silent = true },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

}
