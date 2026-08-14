-- Relative number toggle in insert mode
vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "numbertoggle",
  pattern = "*",
  command = "set relativenumber",
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "numbertoggle",
  pattern = "*",
  command = "set norelativenumber",
})

-- Notify tmux that vim is running (for smart pane switching)
if os.getenv("TMUX") then
  vim.fn.system("tmux set-option -p @vim_running 1")
  vim.api.nvim_create_autocmd("VimLeavePre", {
    command = "silent! !tmux set-option -pu @vim_running",
  })
end

-- Treesitter highlighting (built-in)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Show diagnostics on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      source = true,
      prefix = "",
      scope = "line",
    })
  end,
})

-- Format on save + organize imports
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return end

    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" }, diagnostics = {} },
      apply = true,
    })

    vim.lsp.buf.format({ async = false })
  end,
})
