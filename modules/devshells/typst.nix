{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.typst = pkgs.mkShell {
      packages = with pkgs; [
        typst
        typstfmt
        tinymist
      ];
      shellHook = ''echo "📝 Typst $(typst --version)"'';
    };
  };
}