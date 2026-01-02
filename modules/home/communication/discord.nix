{ ... }:
{
  flake.modules.homeManager.discord = { pkgs, lib, ... }: {
    home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.discord
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      pkgs.discord
    ];

    # Discord settings notes:
    # - Discord stores settings in ~/Library/Application Support/discord/ (macOS)
    # - Settings are managed through the app UI, not declaratively
    # - For privacy: Settings > Privacy & Safety > disable telemetry options
  };
}
