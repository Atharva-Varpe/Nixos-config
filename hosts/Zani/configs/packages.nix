{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages (minimal system-wide packages only)
  environment.systemPackages = with pkgs; [
    os-prober  # For detecting other operating systems in dual boot
  ];
}
