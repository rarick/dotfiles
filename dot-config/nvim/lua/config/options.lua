vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Display
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.number = true
vim.opt.showcmd = false

-- Search
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Folding (treesitter-based)
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Misc
vim.opt.wildmenu = true
vim.opt.timeoutlen = 99999
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.clipboard = "unnamedplus"

-- Diagnostics
local sev = vim.diagnostic.severity
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [sev.ERROR] = "E",
      [sev.WARN]  = "W",
      [sev.INFO]  = "I",
      [sev.HINT]  = "H",
    },
  },
})

-- Transparent background
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
vim.api.nvim_set_hl(0, "FloatNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
