{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # Colorscheme
    colorschemes.dracula.enable = true;

    # extraPackagesはそのまま
    extraPackages = with pkgs; [
      # Nix tools
      nixd # LSP
      nixpkgs-fmt # Formatter
    ];

    # Vimオプション（opts）
    opts = {
      hlsearch = true;
      number = true;
      relativenumber = true;
      mouse = "";
      showmode = false;
      spelllang = "en_gb";
      termguicolors = true;
      background = "dark";
      cursorline = true;
      cursorcolumn = true;
      signcolumn = "auto";
      wrap = false;
      sidescrolloff = 8;
      scrolloff = 8;
      title = true;
      titlestring = "nvim";
      undodir = "${config.xdg.cacheHome}/nvim/undo"; # stdpath("cache")相当
      undofile = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      ignorecase = true;
      smartcase = true;
      gdefault = true;
      splitright = true;
      splitbelow = true;
    };

    # globals
    globals = {
      mapleader = ",";
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    # Clipboard設定（extraConfigLuaで追加）
    extraConfigLua = ''
      vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
    '';

    # キーマップ（conformのフォーマットキーマップ）
    keymaps = [
      {
        key = "<leader>ff";
        action.__raw = "require('conform').format";
        options = {
          desc = "Format file";
        };
      }
    ];
  };

  imports = [
    ./nixvim/completion.nix
    ./nixvim/lsp.nix
    ./nixvim/ui.nix
    ./nixvim/plugins.nix
  ];
}
