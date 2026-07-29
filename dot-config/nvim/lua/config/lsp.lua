-- LSP servers (installed via nix, on $PATH)
-- nvim-lspconfig provides the server definitions,
-- vim.lsp.enable() is the built-in 0.11+ API
local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "starpls",
  "ts_ls",
  "yamlls",
}

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      rustc = {
        source = "discover",
      },
    },
  },
})

vim.lsp.enable(servers)

-- LSP keymaps (supplement built-in grr/gri/grn/gra/grt/gO/Ctrl-S)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
