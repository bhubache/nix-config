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
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    ruff
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  users.users.${configVars.username} = {
    home = "/home/${configVars.username}";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "docker" ];
    password = "nixos";
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  '';
 
  # Import the user's home configurations
  home-manager.users.${configVars.username} = import (
    configLib.relativeToRoot "home/${configVars.username}/${config.networking.hostName}.nix"
  );
}
