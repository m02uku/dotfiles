{
  description = "Pure hermetic Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }:
    let
      # 設定値
      username = "soranagano";
      system = "x86_64-darwin";

      # pkgs の定義
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # プラットフォーム判定
      isDarwin = pkgs.stdenv.isDarwin;
      homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
          {
            home = {
              inherit username homeDirectory;
              stateVersion = "25.11";
            };
          }
        ];
      };
    };
}
