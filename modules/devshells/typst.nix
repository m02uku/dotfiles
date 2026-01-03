{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.typst = pkgs.mkShell {
      packages = with pkgs; [
        typst
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "📝 Typst $(typst --version)"'';
    };
  };
}