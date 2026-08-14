-- LSP servers (installed via nix, on $PATH)
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
