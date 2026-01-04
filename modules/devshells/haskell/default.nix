{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.haskell = pkgs.mkShell {
      packages = with pkgs; [
        haskellPackages.cabal-install
      ];
      shellHook = ''echo "λ Haskell development environment"'';
    };
  };
}