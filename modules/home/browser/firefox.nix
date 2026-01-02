# Firefox Browser
# メイン設定 - 有効化とプロファイル基本設定
# 
# 関連ファイル:
#   extensions.nix - 拡張機能 (uBlock Origin, Vimium C)
#   search.nix     - 検索エンジン (@np, @no, @gh)
#   bookmarks.nix  - ブックマーク
#   privacy.nix    - プライバシー設定
{ ... }:
{
  flake.modules.homeManager.firefox = { ... }: {
    programs.firefox = {
      enable = true;

      profiles.default = {
        isDefault = true;
      };
    };
  };
}

