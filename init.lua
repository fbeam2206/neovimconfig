vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true
vim.opt.relativenumber = true

-- Registered before plugins load so it also fires for the colorscheme
-- applied at startup (themery restores the last selected theme then).
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
  end,
})

-- Must be required before plugins load, so the shim is in place by the time
-- nvim-treesitter registers its query predicates/directives.
require("config.ts-compat")
require("config.lazy")
vim.o.exrc = true
vim.o.secure = true

vim.keymap.set('n', '<leader><CR>', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>', { noremap = true })
-- Buffer navigation on Shift+L / Shift+H so that <Tab> (== <C-i> in a
-- terminal) stays free for jumplist-forward.
vim.keymap.set('n', 'L', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
vim.keymap.set('n', 'H', ':bprev<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
