{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # === Python 環境 (すべて統合) ===
    (python313.withPackages (ps: with ps; [
      # Jupyter
      jupyter
      jupyterlab
      notebook
      ipykernel
      ipywidgets

      # Linting & Formatting
      black
      isort
      mypy

      # Data Science
      numpy
      pandas
      scikit-learn
      matplotlib
      seaborn

      # MLOps
      mlflow
      wandb
      dvc
    ]))

    # === Package Managers ===
    uv

    # === LSP ===
    ruff # ← Python パッケージではないので外に出す

    # === Version Control for Data ===
    git-lfs
  ];

  # === direnv (自動環境切り替え) ===
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
