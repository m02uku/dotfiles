{
  description = "Home Manager configuration of m02uku";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        username = "m02uku";
      in
      {
        packages = {
          hello = pkgs.hello;
        };


        # devShellsを追加
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.hello
            pkgs.neovim  # プレーンなNeovim
          ];
          shellHook = ''
            echo "開発シェルに入りました！"
            echo "hello と nvim が使えます"
          '';
        };

        legacyPackages = {
          homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home.nix ];
          };
        };
      }
    );
}

