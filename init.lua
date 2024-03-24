--Sort out our leader key here
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '

--Relative line numbers for better jumping
vim.wo.relativenumber = true

--Don't show mode
vim.opt.showmode = false

--Highlight when searching but remove when ESC is hit in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>','<cmd>nohlsearch<CR>')

--Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  --Automatic tab/shiftwidth spacing
  'tpope/vim-sleuth',
  --Use 'gc' command to comment visual regions/lines
  'numToStr/Comment.nvim',
  'lewis6991/gitsigns.nvim'
}
