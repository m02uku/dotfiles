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
  };
}
