{ config, pkgs, ... }:

{
  services.openssh = {
    settings.permitRootLogin = "no";
    settings.passwordAuthentication = true;
  };
}
