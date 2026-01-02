{ ... }:
{
  flake.modules.homeManager.slack = { pkgs, lib, ... }: {
    home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.slack
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      pkgs.slack
    ];

    # Slack settings notes:
    # - Slack stores settings in ~/Library/Application Support/Slack/ (macOS)
    # - Keyboard shortcuts: Preferences > Accessibility
    # - Recommended: Enable "Dark Mode" in Preferences > Themes
  };
}
