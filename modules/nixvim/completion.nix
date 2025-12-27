{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";
        sources.default = [ "lsp" "path" "snippets" "buffer" ];
        completion.menu.border = "rounded";
        completion.documentation.window.border = "rounded";
      };
    };
    luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
