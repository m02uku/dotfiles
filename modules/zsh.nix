{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
    };
    
    zsh-abbr = {
      enable = true;
      abbreviations = {
        hms = "home-manager switch --flake ~/dotfiles";
        hmu = "cd ~/dotfiles && nix flake update && home-manager switch --flake ~/dotfiles";
        ls = "eza --icons";
        ll = "eza -lah --icons --git";
        la = "eza -a --icons";
        lt = "eza --tree --icons --git-ignore";
        vi = "nvim";
        vim = "nvim";
        repo= "cd $(ghq list --full-path --exact | peco)";
      };
    };

    defaultKeymap = "viins";

    setOptions = [
      "autocd"
      "hist_ignore_dups"
      "share_history"
    ];
  };
}

