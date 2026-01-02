{ ... }:
{
  flake.modules.homeManager.zellij = {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "default";
        default_shell = "zsh";
        pane_frames = false;
        simplified_ui = true;
        copy_command = "pbcopy";  # macOS, Linux will use wl-copy/xclip
      };
    };
  };
}
