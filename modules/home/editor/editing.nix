{ ... }:
{
  flake.modules.homeManager.neovim-editing = {
    programs.nixvim = {
      plugins.treesitter = {
        enable = true;
        highlight.enable = true;
        settings.ensure_installed = [
          "python"
          "nix"
          "markdown"
          "lua"
          "vim"
          "vimdoc"
          "r"
          "julia"
          "bash"
          "html"
          "quarto"
        ];
      };

      plugins.flash = {
        enable = true;
        settings.modes.search.enabled = true;
      };

      plugins.oil = {
        enable = true;
        settings = {
          default_file_explorer = true;
          columns = [
            "icon"
            "permissions"
            "size"
            "mtime"
          ];
          keymaps = {
            "\\" = "actions.close";
          };
          skip_confirm_for_simple_edits = true;
          view_options = {
            show_hidden = true;
          };
        };
      };

      plugins.mini = {
        enable = true;
        modules = {
          surround = { };
          pairs = { };
          comment = { };
          bufremove = { };
          splitjoin = { };
          move = { };
          ai = { };
        };
      };

      plugins.bullets = {
        enable = true;
        settings = {
          bullets_enabled_file_types = [
            "markdown"
            "text"
            "gitcommit"
            "scratch"
            "quarto"
          ];
        };
      };

      plugins.quarto-nvim = {
        enable = true;
      };

      plugins.snacks = {
        enable = true;
        settings = {
          bigfile.enabled = true;
          quickfile.enabled = true;
          words.enabled = true;
          picker.enabled = true;
          lazygit.enabled = true;
          terminal.enabled = true;
          git.enabled = true;
        };
      };

      plugins.which-key = {
        enable = true;
        settings.delay = 200;
      };
    };
  };
}
