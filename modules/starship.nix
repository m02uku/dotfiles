{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    # ✅ ML エンジニア向け改善
    settings = {
      add_newline = true;

      # === Python 環境表示 ===
      python = {
        format = "via [🐍 $version](bold yellow) ";
        detect_extensions = [ "py" ];
        detect_files = [ ".python-version" "Pipfile" "pyproject.toml" ];
      };

      # === Git 状態 ===
      git_status = {
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      };

      # === Docker ===
      docker_context = {
        format = "via [🐋 $context](blue bold)";
      };

      # === Kubernetes ===
      kubernetes = {
        format = "on [⛵ $context](dimmed green) ";
        disabled = false;
      };

      # === 実行時間 ===
      cmd_duration = {
        min_time = 500;
        format = "took [$duration](bold yellow)";
      };
    };
  };
}

