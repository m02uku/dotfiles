{ ... }:
{
  # LSP, Completion, Lint, Format, Diagnostics
  flake.modules.homeManager.neovim-lsp = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Copilot dependencies
      nodejs
    ];

    programs.nixvim = {
      plugins.lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
          marksman.enable = true;
          tinymist.enable = true;
          volar.enable = true;
        };
      };

      diagnostic = {
        settings = {
          virtual_text = true;
        };
      };

      plugins.blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "default";
          sources.default = [ "lsp" "path" "buffer" ];
          completion = {
            accept.auto_brackets.enabled = true;
            documentation.auto_show = true;
            ghost_text.enabled = true;
          };
          signature.enabled = true;
        };
      };

      plugins.lint = {
        enable = true;
        lintersByFt = {
          python = [ "ruff" ];
          nix = [ "statix" ];
          markdown = [ "markdownlint" ];
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
          vue = [ "eslint" ];
        };
      };

      plugins.conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            python = [ "ruff_format" ];
            nix = [ "nixfmt" ];
            markdown = [ "prettier" ];
            typst = [ "typstyle" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            vue = [ "prettier" ];
          };
        };
      };

      plugins.trouble = {
        enable = true;
        settings.auto_close = true;
      };

    };
  };
}
