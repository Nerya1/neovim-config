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
  {
    'nvim-lualine/lualine.nvim',
    config = {
      options = {
        theme = 'tokyonight',
      },
    },
  },
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
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = {
      style = "night",
    },
  },
  {
    'renerocksai/telekasten.nvim',
    config = {
      home = vim.fn.expand("~/notes"),
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'renerocksai/calendar-vim',
      {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({filetype = {'markdown', 'telekasten'}})
            -- refer to `configuration to change defaults`
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
      },
    },
  },
})

