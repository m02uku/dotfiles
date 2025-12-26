{ config, pkgs, ... }:

let
  draculaTheme = builtins.fetchGit {
    url = "https://github.com/dracula/kitty/";
    rev = "87717a3f00e3dff0fc10c93f5ff535ea4092de70";
  };
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      # Appearance
      background_opacity = "0.5";
      background_blur = "15";

      # Performance / behavior
      enable_audio_bell = false;
    };

    extraConfig = ''
      include ${draculaTheme}/dracula.conf
    '';
  };

  # Ensure the font is available
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

