{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells.python = pkgs.mkShell {
      packages = with pkgs; [
        python313
        python313Packages.pip
        python313Packages.virtualenv
        ruff
      ];
      shellHook = ''echo "🐍 Python $(python --version)"'';
    };
  };
}