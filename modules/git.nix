{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "m02uku";
        email = "m02ukuzrzr@gmail.com";
        # 追加: GPG署名（セキュリティ向上、GitHub Docs推奨）
        signingkey = ""; # GPGキーを設定（例: gpg --list-keys で確認）
      };

      commit.gpgSign = true;

      # === パフォーマンス ===
      core = {
        editor = "nvim";
        # 大きなファイルの扱い
        bigFileThreshold = "512m";
        # 追加: 行末処理（クロスプラットフォーム対応、GitHub Docs推奨）
        autocrlf = "input"; # Linux/Mac環境用
      };

      # === Git LFS (機械学習のモデルファイル用) ===
      filter.lfs = {
        required = true;
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
      };

      # === rebase 設定 ===
      rebase = {
        autoStash = true;
        autoSquash = true;
      };

      # 追加: プッシュ/プル設定（Git公式推奨）
      push.default = "simple"; # 安全なプッシュ動作
      pull.rebase = true; # リベースベースの統合

      # 追加: 初期ブランチ設定（GitHub Docs推奨）
      init.defaultBranch = "main";
    };

    lfs = {
      enable = true;
    };
  };

  # GPG設定追加（Git署名用）
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 36000;
    maxCacheTtl = 36000;
    pinentry.package = pkgs.pinentry-curses; # 変更: 最新形式
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;
      light = false;
      line-numbers = true;
      side-by-side = true; # ✅ true推奨（変更なし）
      syntax-theme = "Dracula";
      # === パフォーマンス ===
      max-line-length = 512;
      # === ML関連の大きなdiffの改善 ===
      hyperlinks = true;
    };
  };
}
