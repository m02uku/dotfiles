{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    
    settings = {
      # Minimal theme settings
      background_opacity = "0.95";
      
      # Colors (Gruvbox Dark)
      foreground = "#ebdbb2";
      background = "#282828";
      
      # Cursor
      cursor = "#ebdbb2";
      cursor_text_color = "#282828";
      
      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;
    };
    
    extraConfig = ''
      # Additional minimal configuration
      enable_audio_bell no
      window_padding_width 4
    '';
  };
  
  # Ensure the font is available
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

