{ ... }:
{
  flake.modules.homeManager.ghostty =
    { pkgs, ... }:
    {
      fonts.fontconfig.enable = true;
      home.packages = with pkgs; [
        maple-mono-nf-cn
      ];

      programs.ghostty = {
        enable = true;
        package =
          if pkgs.stdenv.isLinux then
            pkgs.ghostty
          else if pkgs.stdenv.isDarwin then
            pkgs.brewCasks.ghostty
          else
            throw "unsupported system ${pkgs.stdenv.hostPlatform.system}";
        settings = {
          font-family = "Maple Mono NF CN";
          font-size = 10;
          theme = "dracula";
          background-opacity = 0.8;
          keybind = [
            "ctrl+shift+f=toggle_fullscreen"
          ];
          window-decoration = "auto";
          macos-titlebar-style = "transparent";
        };
        enableZshIntegration = true;
      };
    };
}
