{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.markdown = pkgs.mkShell {
      packages = with pkgs; [
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "📝 Markdown development environment"'';
    };
  };
}