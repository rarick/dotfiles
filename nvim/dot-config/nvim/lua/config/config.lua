----------------
-- vars
--------
-- remap key bindings, using default no-remap and silent
local default_opts = { noremap = true, silent = true }
local function map(mode, input, output, opts)
  vim.keymap.set(mode, input, output, vim.tbl_extend("force", default_opts, opts or {}))
end

----------------
-- general
--------
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.number = true

-- Relative number toggle
vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = "numbertoggle",
  pattern = "*",
  command = "set relativenumber",
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
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
-- search
--------
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight last inserted text
map("n", "gV", "`[v`]")

-- search highlight toggle on <cr>
map("n", "<CR>", ":nohl<CR>")

----------------
-- spacing
--------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

----------------
-- folding
--------
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent"

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
-- move visually with j/k
map("n", "j", "gj")
map("n", "k", "gk")

-- jk to escape
map("i", "jk", "<Esc>")

-- shift-k to split line
map("n", "<S-K>", "i<CR><ESC>")

-- move visually with j/k
map("n", "sn", "<cmd>bnext<CR>")
map("n", "sp", "<cmd>bprevious<CR>")

----------------
-- git mergetool
--------
vim.keymap.set("n", "<leader>gl", "<cmd>diffget LOCAL<CR>", { silent = true })
vim.keymap.set("n", "<leader>gr", "<cmd>diffget REMOTE<CR>", { silent = true })

