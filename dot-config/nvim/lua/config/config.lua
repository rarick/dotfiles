local default_opts = { noremap = true, silent = true }
local function map(mode, input, output, opts)
  vim.keymap.set(mode, input, output, vim.tbl_extend("force", default_opts, opts or {}))
end

----------------
-- general
--------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.number = true

-- Relative number toggle
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

-- tmux vim_running variable
if os.getenv("TMUX") then
  vim.fn.system("tmux set-option -p @vim_running 1")
  vim.api.nvim_create_autocmd("VimLeavePre", {
    command = "silent! !tmux set-option -pu @vim_running",
  })
end

----------------
-- completion (native 0.12)
--------
vim.o.autocomplete = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumborder = "rounded"

----------------
-- search
--------
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
map("n", "gV", "`[v`]")
map("n", "<CR>", ":nohl<CR>")

----------------
-- spacing
--------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

----------------
-- folding (treesitter-based)
--------
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

----------------
-- treesitter (built-in)
--------
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

----------------
-- misc
--------
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true

----------------
-- movement
--------
map("n", "j", "gj")
map("n", "k", "gk")
map("i", "jk", "<Esc>")
map("n", "<S-K>", "i<CR><ESC>")
map("n", "sn", "<cmd>bnext<CR>")
map("n", "sp", "<cmd>bprevious<CR>")

----------------
-- git mergetool
--------
map("n", "<leader>gl", "<cmd>diffget LOCAL<CR>")
map("n", "<leader>gr", "<cmd>diffget REMOTE<CR>")

----------------
-- diagnostics
--------
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

vim.opt.updatetime = 300
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
