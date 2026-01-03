{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.nix = pkgs.mkShell {
      packages = with pkgs; [
        # LSP and tools
        nil
        statix
        nixfmt
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "❄️ Nix development environment"'';
    };
  };
}