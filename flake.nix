{
  description = "Pure hermetic Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      # CHANGE THESE TWO VALUES:
      username = "soranagano";  # Your username
      system = "x86_64-darwin";  # x86_64-darwin, aarch64-darwin, or x86_64-linux
      
      mkHomeConfiguration = system: username:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          
          isDarwin = pkgs.stdenv.isDarwin;
          homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          modules = [
            ./home.nix
            {
              home = {
                inherit username homeDirectory;
                stateVersion = "25.05";
              };
            }
          ];
        };
    in
    {
      homeConfigurations.${username} = mkHomeConfiguration system username;
    };
}
