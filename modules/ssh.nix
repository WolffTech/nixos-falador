{ config, pkgs, ... }:

{
  services.openssh = {
    permitRootLogin = "no";
    passwordAuthentication = true;
  };
}
