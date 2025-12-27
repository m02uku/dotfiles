{ config, pkgs, ... }:

{

  programs.nixvim.plugins = {
    molten = {
      enable = true;
      settings = {
        auto_open_output = false;
        wrap_output = true;
        virt_text_output = true;
      };
    };
    which-key.enable = true;
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
    };
    treesitter-textobjects.enable = true;
    oil.enable = true;
    gitsigns.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = [ "nixpkgs_fmt" ];
          python = [ "black" "isort" ];
          markdown = [ "prettier" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
    };
    nvim-lint.enable = true;
    # windsurf-vim.enable = true;
    todo-comments.enable = true;
    trouble.enable = true;
    flash.enable = true;
    render-markdown.enable = true;
  };
}
