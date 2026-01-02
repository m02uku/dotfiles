{ ... }:
{
  flake.modules.homeManager.zoom = { pkgs, lib, ... }: {
    home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.zoom-us
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      pkgs.zoom-us
    ];

    # Zoom privacy & security settings (configure in app):
    # - Settings > Video: Disable "HD" if bandwidth is limited
    # - Settings > Audio: Test speaker and microphone
    # - Settings > General: Disable "Add Zoom to macOS menu bar"
    # - Settings > Privacy: Review camera/microphone permissions
    #
    # For enterprise: SSO settings are configured through the app
  };
}
