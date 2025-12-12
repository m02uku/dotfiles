{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    # services-flake.url = "github:juspay/services-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      # home-manager,
      flake-parts,
      systems,
      # services-flake,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      perSystem =
        {
          config,
          system,
          pkgs,
          ...
        }: {
          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [
                hello
                cowsay
              ];
            };
          };
          packages.default = pkgs.hello;
        };
    };
}
