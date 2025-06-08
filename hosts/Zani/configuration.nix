# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    
    # Import all configuration modules
    ./configs/boot.nix
    ./configs/networking.nix
    ./configs/locale.nix
    ./configs/desktop.nix
    ./configs/audio.nix
    ./configs/users.nix
    ./configs/packages.nix
    ./configs/programs.nix
    ./configs/services.nix
    ./configs/system.nix
  ];
}
