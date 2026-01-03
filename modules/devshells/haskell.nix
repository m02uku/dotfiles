{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.haskell = pkgs.mkShell {
      packages = with pkgs; [
        # Haskell toolchain
        ghc
        cabal-install
        # LSP and tools
        haskell-language-server
        hlint
        ormolu
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "λ Haskell development environment"'';
    };
  };
}