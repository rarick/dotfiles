----------------
-- borders
--------
local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = border }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = border }
)

----------------
-- bindings
--------
local map = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = desc })
end

vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(
  vim.lsp.handlers["textDocument/definition"],
  { use_preview_window = false }
)

map("gd", vim.lsp.buf.definition, "Go to definition")
map("gD", vim.lsp.buf.declaration, "Go to declaration")
map("gi", vim.lsp.buf.implementation, "Go to implementation")
map("gr", vim.lsp.buf.references, "Go to references")
map("gt", vim.lsp.buf.type_definition, "Go to type def")

----------------
-- popups
--------
-- show on hover
vim.opt.updatetime = 300

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, {
          focusable = false,
          border = "rounded",
          source = "always",
          prefix = "",
          scope = "line",
        })
    end,
  })

