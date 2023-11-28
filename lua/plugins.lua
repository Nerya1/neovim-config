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


require('lazy').setup({
  {
    'nvim-treesitter/nvim-treesitter',
    config = {
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
  'nvim-lualine/lualine.nvim',
  'neovim/nvim-lspconfig',
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    dependencies = {'mfussenegger/nvim-dap',},
  },
  {
    'gfanto/fzf-lsp.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'junegunn/fzf',
    },
  },
  {
    'marko-cerovac/material.nvim',
    config = {
      disable = {
        background = true,
      },
    },
  },
  {
    'kepano/flexoki-neovim',
    name = 'flexoki',
  },
})

