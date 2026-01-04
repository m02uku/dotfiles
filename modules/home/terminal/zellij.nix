{ ... }:
{
  flake.modules.homeManager.zellij = {
    programs.zellij = {
      enable = true;
      settings = {
        # theme = "default";
        default_shell = "zsh";
        default_mode = "locked"; # デフォルトでLocked Mode
        # pane_frames = false;
        # simplified_ui = true;
        keybinds = {
          locked = {
            "Ctrl \\" = "SwitchToMode \"Normal\"";
          };
          normal = {
            "Ctrl \\" = "SwitchToMode \"Locked\"";
          };
        };
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
