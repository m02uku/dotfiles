{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.quarto = pkgs.mkShell {
      packages = with pkgs; [
        quarto
        python313
        python313Packages.jupyter
        python313Packages.matplotlib
        python313Packages.pandas
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "📊 Quarto $(quarto --version)"'';
    };
  };
}