{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.python = pkgs.mkShell {
      packages = with pkgs; [
        python313
        python313Packages.pip
        python313Packages.virtualenv
        # LSP and tools
        pyright
        ruff
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shellHook = ''echo "🐍 Python $(python --version)"'';
    };
  };
}