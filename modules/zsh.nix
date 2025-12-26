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
        # Home Manager
        hms = "home-manager switch --flake ~/dotfiles";
        hmu = "cd ~/dotfiles && nix flake update && home-manager switch --flake ~/dotfiles";
        
        # eza (modern ls)
        ls = "eza --icons";
        ll = "eza -lah --icons --git";
        la = "eza -a --icons";
        lt = "eza --tree --icons --git-ignore";
        
        # neovim
        vi = "nvim";
        vim = "nvim";
        
        # Git shortcuts
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
        gd = "git diff";
        gco = "git checkout";
        gb = "git branch";
        lg = "lazygit";
        
        # Repository navigation
        repo = "cd $(ghq list --full-path | fzf)";
        ghget = "ghq get";
        
        # Directory navigation with zoxide
        z = "zoxide";
        zi = "zoxide query -i";
        
        # Search with ripgrep + fzf
        rgf = "rg --files | fzf --preview 'bat --color=always {}'";
        
        # Quick edits
        ezsh = "nvim ~/dotfiles/modules/zsh.nix";
        ehm = "nvim ~/dotfiles/home.nix";
        
        # Misc
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        cat = "bat";
      };
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
}

