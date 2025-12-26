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
        ll = "ls -lah";
        vi = "nvim";
        vim = "nvim";
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

