{ pkgs, ... }:
{
  flake.modules.homeManager.zellij = {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "default";
        default_shell = "zsh";
        pane_frames = false;
        simplified_ui = true;
        copy_command = if pkgs.stdenv.isDarwin then "pbcopy" else "wl-copy";
      };
    };
    home.file.".config/zellij/layouts/dev.kdl".text = ''
      layout {
        pane split_direction="vertical" {
          pane size="75%" focus=true {
            command "nvim"
          }
          pane split_direction="horizontal" size="40%" {
            pane size="50%"
            pane size="50%"
          }
        }
      }
    '';
  };
}
