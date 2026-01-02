# Firefox Extensions
# NUR (Nix User Repository) から拡張機能をインストール
{ ... }:
{
  flake.modules.homeManager.firefox-extensions = { nurPkgs, ... }: {
    programs.firefox.profiles.default.extensions.packages = 
      with nurPkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin      # 広告ブロック
        vimium-c           # Vimキーバインド
      ];
  };
}
