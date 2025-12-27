{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        pyright = {
          enable = true;
          settings.python.analysis = {
            autoSearchPaths = true;
            useLibraryCodeForTypes = true;
            diagnosticMode = "workspace";
          };
        };
        ruff.enable = true;
        nixd.enable = true;
      };
      inlayHints = true;
    };
    mason = {
      enable = true;
      settings.ui.border = "rounded";
    };
    mason-lspconfig.enable = true;
    mason-nvim-dap.enable = true;
    dap.enable = true;
    dap-ui.enable = true;
    dap-go.enable = true;
  };
}
