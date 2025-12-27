{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # Colorscheme
    colorschemes.dracula.enable = true;

    # extraPackagesはそのまま
    extraPackages = with pkgs; [
      # Nix tools
      nixd # LSP
      nixpkgs-fmt # Formatter
    ];

    # Vimオプション（opts）
    opts = {
      hlsearch = true;
      number = true;
      relativenumber = true;
      mouse = "";
      showmode = false;
      spelllang = "en_gb";
      termguicolors = true;
      background = "dark";
      cursorline = true;
      cursorcolumn = true;
      signcolumn = "auto";
      wrap = false;
      sidescrolloff = 8;
      scrolloff = 8;
      title = true;
      titlestring = "nvim";
      undodir = "${config.xdg.cacheHome}/nvim/undo"; # stdpath("cache")相当
      undofile = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      ignorecase = true;
      smartcase = true;
      gdefault = true;
      splitright = true;
      splitbelow = true;
    };

    # globals
    globals = {
      mapleader = ",";
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    # LSP inlay hints（booleanとして設定）
    plugins.lsp.inlayHints = true;

    # Clipboard設定（extraConfigLuaで追加）
    extraConfigLua = ''
      vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
    '';

    plugins = {
      # web-devicons（明示的に有効化）
      web-devicons.enable = true;

      # LSPサーバー（lspconfigベース）
      lsp = {
        enable = true;
        servers = {
          pyright = {
            enable = true;
            settings.python.analysis = {
              autoSearchPaths = true;
              useLibraryCodeForTypes = true;
              diagnosticMode = "workspace";
            };
          };
          ruff.enable = true; # ruff_lsp から変更
          nixd.enable = true;
        };
      };

      # Molten-nvim
      molten = {
        enable = true;
        settings = {
          auto_open_output = false;
          wrap_output = true;
          virt_text_output = true;
        };
      };

      # which-key
      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          icons = {
            breadcrumb = "»";
            separator = "➜";
            group = "+";
          };
          win = {
            border = "single";
          };
        };
        registrations = {
          "<leader>f" = "File/Format";
          "<leader>g" = "Git";
          "<leader>e" = "Edit config";
          "<leader>b" = "Buffer";
          "<leader>w" = "Window";
        };
      };

      # Formatter (conform-nvim)
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "nixpkgs_fmt" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
        };
      };

      # Treesitter（grammarPackages削除、デフォルトでall）
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      # Telescope
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fs" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };
    };

    # キーマップ（conformのフォーマットキーマップ）
    keymaps = [
      {
        key = "<leader>ff";
        action.__raw = "require('conform').format";
        options = {
          desc = "Format file";
        };
      }
    ];
  };
}
