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
    };

    defaultKeymap = "viins";

    setOptions = [
      "autocd"
      "hist_ignore_dups"
      "share_history"
    ];

    initContent = ''
      if [[ !  -d /usr/local/share/zsh/site-functions ]]; then
        fpath=("''${(@)fpath:#/usr/local/share/zsh/site-functions}")
      fi

      eval "$(zoxide init zsh)"
      source <(fzf --zsh)
    '';
  };

  imports = [
    ./zsh/aliases.nix
  ];
}



