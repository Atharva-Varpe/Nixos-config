{ config, pkgs, ... }:

{
  # Define user accounts
  users.users.luna = {
    isNormalUser = true;
    description = "Luna";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
