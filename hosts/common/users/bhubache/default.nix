{
  pkgs,
  inputs,
  config,
  lib,
  configVars,
  configLib,
  ...
}:
{
  users.users.${configVars.username} = {
    home = "/home/${configVars.username}";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
    password = "nixos";
  };
 
  # Import the user's home configurations
  home-manager.users.${configVars.username} = import (
    configLib.relativeToRoot "home/${configVars.username}/${config.networking.hostName}.nix"
  );
}
