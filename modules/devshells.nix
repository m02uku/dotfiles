{ ... }:
{
  perSystem = { pkgs, ... }: {
    devShells = {
      # Python
      python = pkgs.mkShell {
        packages = with pkgs; [
          python313
          python313Packages.pip
          python313Packages.virtualenv
          ruff
        ];
        shellHook = ''echo "🐍 Python $(python --version)"'';
      };

      # Slidev (presentation)
      slidev = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_22
          nodePackages.pnpm
        ];
        shellHook = ''
          echo "🎨 Slidev environment"
          echo "Run: pnpm create slidev"
        '';
      };

      # Quarto (scientific publishing)
      quarto = pkgs.mkShell {
        packages = with pkgs; [
          quarto
          python313
          python313Packages.jupyter
          python313Packages.matplotlib
          python313Packages.pandas
        ];
        shellHook = ''echo "📊 Quarto $(quarto --version)"'';
      };

      # Typst (typesetting)
      typst = pkgs.mkShell {
        packages = with pkgs; [
          typst
          typstfmt
          tinymist
        ];
        shellHook = ''echo "📝 Typst $(typst --version)"'';
      };
    };
  };
}
