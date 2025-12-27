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
        # zsh-abbr
        abl = "abbr list";
        abg = "abbr list | grep";
        abf = "abbr list | fzf";

        # Home Manager
        hms = "home-manager switch --flake ~/dotfiles";
        hmu = "cd ~/dotfiles && nix flake update && home-manager switch --flake ~/dotfiles";

        # eza (modern ls)
        ls = "eza --icons";
        ll = "eza -lah --icons --git";
        la = "eza -a --icons";
        lt = "eza --tree --icons --git-ignore";

        # Modern alternatives
        cat = "bat";
        top = "btop";
        du = "dust";
        df = "duf";
        ps = "procs";

        # Editor
        vi = "nvim";
        vim = "nvim";

        # === Git (統合版) ===
        g = "git";

        # Basic commands
        gs = "git status -sb"; # ✅ -sb で短く見やすく
        ga = "git add";
        gap = "git add -p"; # ✅ インタラクティブに追加
        gaa = "git add --all";

        # Commit
        gc = "git commit";
        gcm = "git commit -m";
        gca = "git commit --amend";
        gcan = "git commit --amend --no-edit";
        gcf = "git commit --fixup"; # ✅ rebase で自動 squash

        # Branch
        gb = "git branch";
        gba = "git branch -a"; # ✅ リモートブランチも表示
        gbd = "git branch -d";
        gbD = "git branch -D"; # ✅ 強制削除

        # Checkout
        gco = "git checkout";
        gcb = "git checkout -b"; # ✅ 新しいブランチを作成
        gcom = "git checkout main";
        gcod = "git checkout develop";

        # Switch (Git 2.23+)
        gsw = "git switch";
        gswc = "git switch -c"; # ✅ 新しいブランチを作成
        gswm = "git switch main";

        # Diff
        gd = "git diff";
        gds = "git diff --staged"; # ✅ staged の差分
        gdw = "git diff --word-diff"; # ✅ 単語単位の差分

        # Log
        gl = "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        gla = "git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        glog = "git log --oneline --graph --decorate";

        # Push & Pull
        gp = "git push";
        gpf = "git push --force-with-lease"; # ✅ 安全な force push
        gpu = "git push -u origin HEAD"; # ✅ 現在のブランチを push
        gpl = "git pull";
        gplr = "git pull --rebase"; # ✅ rebase で pull

        # Fetch
        gf = "git fetch";
        gfa = "git fetch --all";
        gfo = "git fetch origin";

        # Rebase
        grb = "git rebase";
        grbi = "git rebase -i";
        grbc = "git rebase --continue";
        grba = "git rebase --abort";
        grbm = "git rebase main";

        # Stash
        gst = "git stash";
        gstp = "git stash pop";
        gstl = "git stash list";
        gsta = "git stash apply";
        gstd = "git stash drop";

        # Reset
        grh = "git reset HEAD";
        grhh = "git reset --hard HEAD";

        # Remote
        gr = "git remote";
        grv = "git remote -v";

        # Clean
        gclean = "git clean -fd";

        # Worktree
        gwt = "git worktree";
        gwta = "git worktree add";
        gwtl = "git worktree list";
        gwtr = "git worktree remove";

        # Lazygit
        lg = "lazygit";

        # Repository navigation
        repo = "$(ghq list --full-path | fzf)";
        ghget = "ghq get";

        # Directory navigation
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";

        # Search utilities
        rgf = "rg --files | fzf --preview 'bat --color=always {}'";

        # Zellij (terminal multiplexer)
        zj = "zellij";
        zja = "zellij attach";
        zjl = "zellij list-sessions";
        zjk = "zellij kill-session";

        # Quick config edits
        ezsh = "nvim ~/dotfiles/modules/zsh.nix";
        ehm = "nvim ~/dotfiles/home.nix";
        egit = "nvim ~/dotfiles/modules/git.nix";
        envim = "nvim ~/dotfiles/modules/neovim.nix";

        # Utilities
        tldr = "tldr";
        help = "tldr";

        # Python 環境
        py = "python3";
        ipy = "ipython";
        jl = "jupyter lab";
        jn = "jupyter notebook";
        jk = "jupyter kernelspec list";

        # UV
        uvi = "uv pip install";
        uvs = "uv pip sync";

        # Docker
        dk = "docker";
        dkc = "docker-compose";
        dkps = "docker ps";
        dkimg = "docker images";
        dkrm = "docker rm -f";

        # データ処理
        csvlook = "csvlook"; # csvkit
        jqless = "jq -C | less -R";

        # GPU モニタリング
        gpuwatch = "watch -n 1 nvidia-smi";
        gpumem = "nvidia-smi --query-gpu=memory.used,memory.total --format=csv";

        # === GPG (追加) ===
        ggen = "gpg --gen-key"; # GPG鍵生成
        gls = "gpg --list-keys"; # 鍵リスト表示
        gexp = "gpg --armor --export"; # 公開鍵エクスポート
        gimp = "gpg --import"; # 鍵インポート
        gon = "git config commit.gpgSign true"; # コミット自動署名有効
        goff = "git config --global --unset commit.gpgSign"; # 自動署名無効
        gset = "git config --global user.signingkey"; # 署名鍵設定
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



