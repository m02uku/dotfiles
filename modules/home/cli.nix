{ ... }:
{
  flake.modules.homeManager.programs =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # Modern ls/cat
        eza
        bat

        # JSON/HTTP
        jq
        curl
        wget
        xh # Modern curl for APIs

        # System monitoring
        btop # Modern htop
        dust # Modern du
        duf # Modern df

        # Productivity
        tldr # Simplified man pages
        trash-cli # Safe rm
        entr # Run command on file change
        sshfs # Mount remote directories over SSH

        # Git
        gh
        ghq
        lazygit

        # Containers
        colima # Docker on macOS/Linux without Docker Desktop
        docker # Docker CLI (colima provides the daemon)

        # Search
        ripgrep
        fd

        # Nix tools
        comma # Run uninstalled commands: , cowsay hello
      ];

      programs = {

        git = {
          enable = true;
          settings = {
            user = {
              name = "s0r4d3v";
              email = "s0r4d3v@gmail.com";
            };
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = true;
          };
        };

        jujutsu = {
          enable = true;
          settings = {
            user = {
              name = "s0r4d3v";
              email = "s0r4d3v@gmail.com";
            };
          };
        };

        delta = {
          enable = true;
          enableGitIntegration = true;
        };

        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };

        fzf = {
          enable = true;
          enableZshIntegration = true;
        };

        # nix-index: provides nix-locate command
        nix-index = {
          enable = true;
          enableZshIntegration = true;
        };

        opencode = {
          enable = true;
          settings = {
            theme = "dracula";
          };
        };
      };
    };

  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ nix-your-shell ];

      # Zsh
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        initContent = ''
          # Fix Homebrew completions
          if command -v brew >/dev/null 2>&1; then
            FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
          fi

          nd() {
            nix develop "$DOTFILES_PATH#$1"
          }
          if command -v nix-your-shell > /dev/null; then
            nix-your-shell zsh | source /dev/stdin
          fi
        '';

        history = {
          size = 10000;
          save = 10000;
          ignoreDups = true;
          ignoreSpace = true;
          share = true;
        };

        shellAliases = {
          # File listing (eza)
          ls = "eza";
          ll = "eza -la";
          la = "eza -a";
          lt = "eza --tree";
          l = "eza -l";

          # File viewing
          cat = "bat";
          less = "bat --paging=always";

          # Git
          g = "git";
          gs = "git status";
          gd = "git diff";
          gl = "git log --oneline -20";
          gp = "git push";
          ga = "git add";
          gc = "git commit";
          gco = "git checkout";
          gb = "git branch";
          lg = "lazygit";

          # Editor
          v = "nvim";
          vi = "nvim";
          vim = "nvim";

          # Navigation
          "." = "cd ..";
          ".." = "cd ../..";
          "..." = "cd ../../..";

          # Safety
          rm = "trash-put";
          cp = "cp -i";
          mv = "mv -i";

          # System
          top = "btop";
          du = "dust";
          df = "duf";
          help = "tldr";

          # Tmux
          tm = "tmux";

          # HTTP
          http = "xh";
          https = "xh --https";

          # Opencode
          oc = "opencode";
        };
      };

      # Zoxide (smart cd)
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };

}
