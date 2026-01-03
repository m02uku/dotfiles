{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.hask = pkgs.mkShell {
      packages = with pkgs; [
        haskell.compiler.ghc
        haskellPackages.haskell-language-server
        haskellPackages.hlint
        haskellPackages.ormolu
        haskellPackages.cabal-install
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "λ Haskell development environment"'';
    };
  };
}