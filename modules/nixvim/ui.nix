{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        # dashboard.enabled = true;
        indent.enabled = true;
        input.enabled = true;
        picker.enabled = true;
        notifier.enabled = true;
        quickfile.enabled = true;
        scroll.enabled = true;
        statuscolumn.enabled = true;
        words.enabled = true;
      };
    };
    mini = {
      enable = true;
      modules = {
        ai = { };
        align = { };
        comment = { };
        cursorword = { };
        icons = { };
        # indent = { };
        jump = { };
        pairs = { };
        starter = { };
        surround = { };
      };
      mockDevIcons = true;
    };
    # web-devicons.enable = true;
    lualine.enable = true;
    noice.enable = true;
  };
}
