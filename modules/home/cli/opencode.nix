{ ... }:
{
  flake.modules.homeManager.opencode =
    { pkgs, ... }:
    {
      programs.opencode = {
        enable = true;
        settings = {
          model = "xai/grok-code-fast-1";
          theme = "dracula";
        };
        rules = "# Global Instructions\n\nUse Nix and Home Manager latest best practices.";
      };
    };
}
