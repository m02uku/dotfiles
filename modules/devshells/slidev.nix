{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.slidev = pkgs.mkShell {
      packages = with pkgs; [
        nodejs_22
        nodePackages.pnpm
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''
        echo "🎨 Slidev environment"
        echo "Run: pnpm create slidev"
      '';
    };
  };
}