{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    # web-devicons（明示的に有効化）
    web-devicons.enable = true;

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
          python = [ "black" "isort" ];
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
}
