{ config, pkgs, ... }:

{
  # Command-line utilities
  home.packages = with pkgs; [
    # Network utilities
    wget
    curl

    # Text editor
    vim

    # for nvidia gpu checking
    pciutils

  ];
}
