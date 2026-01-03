{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.typst = pkgs.mkShell {
      packages = with pkgs; [
        typst
        tinymist
        typstyle
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "📝 Typst $(typst --version)"'';
    };
  };
}