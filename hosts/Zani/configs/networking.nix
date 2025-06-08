{ config, pkgs, ... }:

{
  # Networking configuration
  networking.hostName = "Zani";
  networking.networkmanager.enable = true;
}
