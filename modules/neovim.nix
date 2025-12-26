{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # Nix tools
      nixd # LSP
      nixpkgs-fmt # Formatter
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      
      -- Basic settings
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.smartindent = true
      vim.opt.mouse = ""
      vim.opt.clipboard = "unnamedplus"
      
      -- which-key timeout
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    '';

    plugins = with pkgs.vimPlugins; [
      # which-key
      {
        plugin = which-key-nvim;
        type = "lua";
        config = ''
          local wk = require("which-key")
          
          wk.setup({
            preset = "modern",
            icons = {
              breadcrumb = "»",
              separator = "➜",
              group = "+",
            },
            win = {
              border = "single",
            },
          })
          
          -- v3.x の新しい add() API
          wk.add({
            { "<leader>f", group = "File/Format" },
            { "<leader>g", group = "Git" },
            { "<leader>e", group = "Edit config" },
            { "<leader>b", group = "Buffer" },
            { "<leader>w", group = "Window" },
          })
        '';
      }

      # Formatter
      {
        plugin = conform-nvim;
        type = "lua";
        config = ''
          local conform = require('conform')
          
          conform.setup({
            formatters_by_ft = {
              nix = { "nixpkgs_fmt" },
            },
            format_on_save = {
              timeout_ms = 500,
              lsp_fallback = true,
            },
          })
          
          -- Format キーバインド
          vim.keymap.set('n', '<leader>ff', function()
            conform.format({ async = true, lsp_fallback = true })
          end, { desc = 'Format file' })
        '';
      }

      # Neovim 0.11+ の新しい LSP 方式
      plenary-nvim # lspconfig の依存関係
      nvim-lspconfig
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          -- Neovim 0.11+ ネイティブ API
          vim.lsp.config.nixd = {
            cmd = { 'nixd' },
            filetypes = { 'nix' },
            root_markers = { 'flake.nix', '.git' },
          }
          
          -- LSP を有効化
          vim.lsp.enable('nixd')
        '';
      }

      # Treesitter (正しいモジュール名)
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

      # Telescope
      plenary-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')
          
          vim.keymap.set('n', '<leader>fs', builtin.find_files, { desc = 'Search files' })
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
          vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
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
