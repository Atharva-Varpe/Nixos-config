{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # Spotify with Spicetify customization and ad-blocking
  programs.spicetify = {
    enable = true;
    
    # Basic extensions
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
      hidePodcasts
    ];
    
    # Catppuccin theme
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
