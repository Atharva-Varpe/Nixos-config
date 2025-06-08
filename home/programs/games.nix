{ config, pkgs, ... }:

{
  # Gaming packages
  home.packages = with pkgs; [
    # Strategy Games
    mindustry

    # Gaming utilities
    steam
    lutris
    gamemode
    mangohud

    # Emulation
    retroarch

    # Minecraft
    prismlauncher # Better Minecraft launcher

    # Other games
    # supertuxkart
    # 0ad
    # warzone2100
    # freeciv
    # openttd

    # Gaming libraries (may be needed for some games)
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];
}
