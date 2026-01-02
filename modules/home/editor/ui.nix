{ ... }:
{
  # UI: Colorscheme, Statusline, Snacks
  flake.modules.homeManager.neovim-ui = {
    programs.nixvim = {
      colorschemes.tokyonight = {
        enable = true;
        settings.style = "night";
      };

      plugins.lualine = {
        enable = true;
        settings.options = {
          theme = "auto";
          globalstatus = true;
          component_separators = { left = "│"; right = "│"; };
          section_separators = { left = ""; right = ""; };
        };
      };

      plugins.snacks = {
        enable = true;
        settings = {
          # UI
          dashboard.enabled = true;
          notifier.enabled = true;
          statuscolumn.enabled = true;
          indent.enabled = true;
          scroll.enabled = true;

          # Performance
          bigfile.enabled = true;
          quickfile.enabled = true;
          words.enabled = true;

          # Features
          picker.enabled = true;
          lazygit.enabled = true;
          terminal.enabled = true;
          git.enabled = true;
        };
      };
    };
  };
}
