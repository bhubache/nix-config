{ configVars, ... }:
{
  imports = [
    common/core
  ];
  
  home = {
    username = configVars.username;
    homeDirectory = "/home/${configVars.username}";
  };
}
