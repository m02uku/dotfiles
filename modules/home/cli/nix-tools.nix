{ ... }:
{
  flake.modules.homeManager.nix-tools = { pkgs, ... }: {
    home.packages = with pkgs; [
      comma          # Run uninstalled commands: , cowsay hello
      nix-index      # Database for nix-locate
    ];

    # nix-index: provides nix-locate command
    programs.nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
