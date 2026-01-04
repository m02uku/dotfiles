{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.hask = pkgs.mkShell {
      packages = with pkgs; [
        ghc
        haskellPackages.cabal-install
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "λ Haskell development environment"'';
    };
  };
}