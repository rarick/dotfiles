local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function o(extra)
  return vim.tbl_extend("force", opts, extra or {})
end

-- Search
map("n", "gV", "`[v`]", o())
map("n", "<CR>", ":nohl<CR>", o())

-- Movement
map("n", "j", "gj", o())
map("n", "k", "gk", o())
map("i", "jk", "<Esc>", o())
map("n", "<S-K>", "i<CR><ESC>", o())
map("n", "sn", "<cmd>bnext<CR>", o())
map("n", "sp", "<cmd>bprevious<CR>", o())

-- Git mergetool
map("n", "<leader>gl", "<cmd>diffget LOCAL<CR>", o({ desc = "Diffget LOCAL" }))
map("n", "<leader>gr", "<cmd>diffget REMOTE<CR>", o({ desc = "Diffget REMOTE" }))

-- Fzf-lua
map("n", "sg", "<cmd>FzfLua git_files<CR>", { desc = "Git Files" })
map("n", "st", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "sm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
map("n", "sf", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
map("n", "s/", "<cmd>FzfLua live_grep_resume<CR>", { desc = "Live Grep" })
map("n", "ss", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Defs/Refs" })

-- Tmux navigation
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

-- LSP (supplement built-in grr/gri/grn/gra/grt/gO/Ctrl-S)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gh", vim.lsp.buf.hover, { desc = "Hover info" })
map("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
map("n", "<leader>i", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.title:find("Replace qualified path with")
    end,
    apply = true,
  })
end, { desc = "Replace qualified path with use" })
