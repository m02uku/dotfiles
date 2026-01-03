{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.nix = pkgs.mkShell {
      packages = with pkgs; [
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "❄️ Nix development environment"'';
    };
  };
}