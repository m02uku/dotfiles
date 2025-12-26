{ config, pkgs, ... }: 

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "m02uku";
        email = "m02ukuzrzr@gmail.com";
      };
      
      init. defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";
      push.default = "current";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };
  
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    
    options = {
      navigate = true;
      light = false;
      line-numbers = true;
      side-by-side = false;
    };
  };
}
