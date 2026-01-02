{ ... }:
{
  flake.modules.homeManager.search = { pkgs, ... }: {
    home.packages = with pkgs; [
      ripgrep
      fd
    ];

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
