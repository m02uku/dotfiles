{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        preselect = "none";
      };
    };
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
      settings = {
        hover = {
          border = "rounded";
        };
        signatureHelp = {
          border = "rounded";
        };
        diagnostics = {
          virtual_text = true;
        };
      };
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
