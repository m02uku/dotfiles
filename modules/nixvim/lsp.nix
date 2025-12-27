{ config, pkgs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      pyright = {
        enable = true;
        settings.python.analysis = {
          autoSearchPaths = true;
          useLibraryCodeForTypes = true;
          diagnosticMode = "workspace";
        };
      };
      ruff = {
        enable = true;
        settings = {
          args = [ "--config" "~/.config/ruff/ruff.toml" ]; # Optional custom config path
        };
      };
      nixd.enable = true;
    };
  };
}
