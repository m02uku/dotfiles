{ ... }:
{
  flake.modules.homeManager.packages = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Git tools
      gh
      ghq
      lazygit

      # Search & Navigation
      ripgrep
      fd

      # Modern CLI
      eza
      bat
      jq
      curl
      wget
    ];
  };
}
