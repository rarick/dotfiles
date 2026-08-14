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
      completion = {
        autoimport = { enable = true },
        fullFunctionSignatures = { enable = true },
      },
      imports = {
        granularity = { group = "module" },
        prefix = "plain",
        preferNoStd = false,
      },
      assist = {
        emitMustUse = true,
      },
    },
  },
})

vim.lsp.enable(servers)

-- LSP keymaps (supplement built-in grr/gri/grn/gra/grt/gO/Ctrl-S)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>i", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.title:find("Replace qualified path with")
    end,
    apply = true,
  })
end, { desc = "Replace qualified path with use" })

-- Format on save + organize imports (Rust: also shortens qualified paths)
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return end

    -- Run organize imports (adds use statements for qualified paths)
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" }, diagnostics = {} },
      apply = true,
    })

    -- Format
    vim.lsp.buf.format({ async = false })
  end,
})
