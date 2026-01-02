{ ... }:
{
  flake.modules.homeManager.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        addKeysToAgent = "yes";
        extraOptions = {
          StrictHostKeyChecking = "accept-new";
          ServerAliveInterval = "60";
          ServerAliveCountMax = "3";
        };
      };
    };
  };
}
