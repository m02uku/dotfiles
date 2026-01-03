{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.markdown = pkgs.mkShell {
      packages = with pkgs; [
        # LSP and tools
        marksman
        markdownlint-cli
        nodePackages.prettier
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "📝 Markdown development environment"'';
    };
  };
}