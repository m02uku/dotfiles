{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    plugins = with pkgs.vimPlugins; [
      # Minimal plugin set - LSP and treesitter
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      
      # Essential utilities
      plenary-nvim
      telescope-nvim
      
      # Color scheme
      gruvbox-nvim
    ];
    
    extraLuaConfig = ''
      -- Minimal Neovim configuration
      vim.g.mapleader = ' '
      
      -- Basic settings
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.smartindent = true
      vim.opt.termguicolors = true
      vim.opt.mouse = 
      
      -- Color scheme
      vim.cmd([[colorscheme gruvbox]])
      
      -- Treesitter
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
      
      -- Telescope keymaps
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    '';
  };
}

