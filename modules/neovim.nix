{ config, pkgs, ... }: 

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      
      -- Basic settings
      vim. opt.number = true
      vim.opt.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt. tabstop = 2
      vim.opt.smartindent = true
      vim.opt.mouse = ""
      vim.opt. clipboard = "unnamedplus"
    '';

    plugins = with pkgs.vimPlugins; [
      # LSP
      nvim-lspconfig

      # Treesitter
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require('nvim-treesitter.configs').setup({
            highlight = { enable = true },
            indent = { enable = true },
          })
        '';
      }

      # Telescope dependencies
      plenary-nvim
      
      # Telescope
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        '';
      }

      # Color scheme
      {
        plugin = dracula-nvim;
        type = "lua";
        config = ''
          vim.cmd[[colorscheme dracula]]
        '';
      }
    ];
  };
}
