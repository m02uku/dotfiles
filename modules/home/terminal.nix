{ ... }:
{
  flake.modules.homeManager.tmux =
    { pkgs, ... }:
    {
      programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        shortcut = "a";
        mouse = false;

        plugins = with pkgs.tmuxPlugins; [
          sensible
          yank
          prefix-highlight
          {
            plugin = resurrect;
            extraConfig = ''
              set -g @resurrect-strategy-nvim 'session'
              set -g @resurrect-capture-pane-contents 'on'
            '';
          }
          {
            plugin = continuum;
            extraConfig = ''
              set -g @continuum-restore 'on'
              set -g @continuum-save-interval '60'
            '';
          }
        ];

        extraConfig = ''
          # Vi mode for copy mode
          setw -g mode-keys vi

          # Vi mode copy settings
          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection
          bind-key -T copy-mode-vi 'r' send -X rectangle-toggle

          # Reload config
          bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

          # Enter copy mode
          bind v copy-mode

          # Smart split commands
          bind \\ split-window -h -c "#{pane_current_path}"
          bind - split-window -v -c "#{pane_current_path}"
          unbind '"'
          unbind %

          # Vim-style pane navigation
          bind h select-pane -L
          bind j select-pane -D
          bind k select-pane -U
          bind l select-pane -R

          # Pane resizing
          bind -r H resize-pane -L 5
          bind -r J resize-pane -D 5
          bind -r K resize-pane -U 5
          bind -r L resize-pane -R 5

          # Window status styling
          setw -g window-status-current-format '#[bg=colour214,fg=colour237,nobold]#[bg=colour214,fg=colour239] #I #[bg=colour214,fg=colour239,bold]#[bg=colour214,fg=colour239] #W #[bg=colour237,fg=colour214,nobold]'
          setw -g window-status-format '#[bg=colour239,fg=colour237,noitalics]#[bg=colour239,fg=colour223] #I #[bg=colour239,fg=colour223]#[bg=colour239,fg=colour223] #W #[bg=colour237,fg=colour239,noitalics]'
          setw -g window-status-current-style 'bg=colour214,fg=colour237'
          setw -g window-status-style 'bg=colour239,fg=colour223'
          setw -g window-status-separator ""

          # Automatic window renumbering
          set -g renumber-windows on

          # Activity monitoring
          setw -g monitor-activity on
          set -g visual-activity on

          # Purple-themed status bar
          set -g status-position bottom
          set -g status-bg colour235
          set -g status-fg colour248
          set -g status-left '#[bg=colour237,fg=colour248] #[bg=colour235,fg=colour237,nobold]#[bg=colour235,fg=colour248] #S #[bg=colour235,fg=colour237,nobold]'
          set -g status-right '#[bg=colour235,fg=colour237]#[bg=colour237,fg=colour248] %H:%M %d-%b-%y #[bg=colour237,fg=colour235]#[bg=colour235,fg=colour248] #h '
          set -g status-left-length 100
          set -g status-right-length 100

          # Window status styling with purple accents
          setw -g window-status-current-format '#[bg=colour141,fg=colour235,nobold]#[bg=colour141,fg=colour235] #I #[bg=colour141,fg=colour235,bold]#[bg=colour141,fg=colour235] #W #[bg=colour235,fg=colour141,nobold]'
          setw -g window-status-format '#[bg=colour239,fg=colour235,noitalics]#[bg=colour239,fg=colour248] #I #[bg=colour239,fg=colour248]#[bg=colour239,fg=colour248] #W #[bg=colour235,fg=colour239,noitalics]'
          setw -g window-status-current-style 'bg=colour141,fg=colour235'
          setw -g window-status-style 'bg=colour239,fg=colour248'
          setw -g window-status-separator ""

          # Pane borders with purple theme
          set -g pane-border-style 'fg=colour238,bg=colour235'
          set -g pane-active-border-style 'fg=colour141,bg=colour235'

          # Message styling
          set -g message-style 'bg=colour239,fg=colour248'
          set -g message-command-style 'bg=colour239,fg=colour248'

          # Mode styling
          set -g mode-style 'bg=colour141,fg=colour235'
        '';
      };
    };

  flake.modules.homeManager.wezterm =
    { pkgs, ... }:
    {
      fonts.fontconfig.enable = true;
      home.packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      programs.wezterm = {
        enable = true;
        extraConfig = ''
          local config = wezterm.config_builder()
          -- Font
          config.font = wezterm.font("FiraCode Nerd Font")
          config.font_size = 10.0
          -- Appearance
          config.color_scheme = "Dracula"
          config.window_background_opacity = 0.8
          config.window_decorations = "RESIZE"
          config.hide_tab_bar_if_only_one_tab = true
          config.macos_window_background_blur = 10
          -- Keys
          config.keys = {
            { key = "f", mods = "CTRL|SHIFT", action = wezterm.action.ToggleFullScreen },
          }
          return config
        '';
      };
    };

  flake.modules.homeManager.starship =
    { pkgs, ... }:
    {
      # Starship prompt
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          format = ''
            [🚀](bold #50fa7b)$directory$git_branch$git_commit$git_state$git_status$git_metrics$nix_shell$python$nodejs$rust$golang$cmd_duration$time$memory$battery
            $character
          '';
          character = {
            success_symbol = "[❯](bold #50fa7b)"; # Dracula green
            error_symbol = "[❯](bold #ff5555)"; # Dracula red
            vimcmd_symbol = "[❮](bold #bd93f9)"; # vim mode
          };
          directory = {
            style = "bold #8be9fd"; # Dracula cyan
            truncation_length = 3;
            truncate_to_repo = true;
            format = "[📁 $path]($style) ";
          };
          git_branch = {
            symbol = "🌱";
            style = "bold #bd93f9"; # Dracula purple
            format = "[$symbol$branch]($style) ";
          };
          git_status = {
            style = "bold #f1fa8c"; # Dracula yellow
            format = "[$all_status$ahead_behind]($style) ";
          };
          git_commit = {
            commit_hash_length = 7;
            style = "bold #6272a4"; # Dracula comment
            format = "[\\($hash\\)]($style) ";
          };
          git_state = {
            style = "bold #ffb86c"; # Dracula orange
            format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
          };
          git_metrics = {
            disabled = false;
            format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
            added_style = "bold #50fa7b";
            deleted_style = "bold #ff5555";
          };
          python = {
            symbol = "🐍";
            style = "bold #50fa7b";
            format = "[$symbol$version]($style) ";
            detect_files = [
              "requirements.txt"
              "pyproject.toml"
              "Pipfile"
            ];
          };
          nodejs = {
            symbol = "📗";
            style = "bold #50fa7b";
            format = "[$symbol$version]($style) ";
            detect_files = [
              "package.json"
              "yarn.lock"
              "pnpm-lock.yaml"
            ];
          };
          nix_shell = {
            symbol = "❄️";
            style = "bold #8be9fd";
            format = "[$symbol$state]($style) ";
          };
          rust = {
            symbol = "🦀";
            style = "bold #ff5555";
            format = "[$symbol$version]($style) ";
            detect_files = [ "Cargo.toml" ];
          };
          golang = {
            symbol = "🐹";
            style = "bold #8be9fd";
            format = "[$symbol$version]($style) ";
            detect_files = [ "go.mod" ];
          };
          cmd_duration = {
            min_time = 1000;
            style = "bold #ffb86c"; # Dracula orange
            format = "[⏱️ $duration]($style) ";
          };
          time = {
            disabled = false;
            format = "[$time]($style) ";
            style = "bold #6272a4"; # Dracula comment
          };
          memory_usage = {
            disabled = false;
            format = "[$ram]($style) ";
            style = "bold #ffb86c"; # Dracula orange
          };
          battery = {
            full_symbol = "🔋";
            charging_symbol = "⚡";
            discharging_symbol = "💀";
            format = "[$symbol$percentage](bold #50fa7b) ";
          };
        };
      };
    };
}
