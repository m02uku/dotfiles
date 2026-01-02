{ inputs, config, ... }:
let
  localPath = ../../local.nix;
  localExists = builtins.pathExists localPath;
  local = if localExists then import localPath else { user = "dev"; homeDir = "/home/dev"; };
  hmModules = builtins.attrValues config.flake.modules.homeManager;
in
{
  perSystem = { pkgs, ... }: {
    legacyPackages.homeConfigurations.${local.user} =
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit (local) user homeDir; };
        modules = [ inputs.nixvim.homeModules.nixvim ] ++ hmModules;
      };
  };
}
