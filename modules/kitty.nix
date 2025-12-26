{ config, pkgs, ... }:

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
      background = "#1f1f1f";
      foreground = "#ff88c7";

      selection_background = "#ff88c7";
      selection_foreground = "#1e051c";

      cursor = "#ff008c";
      url_color = "#40e0d1";

      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Terminal colors
      color0  = "#000000";  color8  = "#ff7bdc";
      color1  = "#ff50a2";  color9  = "#ffabd5";
      color2  = "#ff7fce";  color10 = "#f893f3";
      color3  = "#d6fff7";  color11 = "#ebb9f7";
      color4  = "#fb7ac8";  color12 = "#ffb4dd";
      color5  = "#ff2194";  color13 = "#ffe9be";
      color6  = "#fc3e9d";  color14 = "#e0c2ff";
      color7  = "#fdbaff";  color15 = "#ffffff";

      # Performance / behavior
      enable_audio_bell = false;
      background_blur = "15";
    };
  };

  # Ensure the font is available
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

