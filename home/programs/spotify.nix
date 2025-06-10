{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{  # Spotify with Spicetify customization and transparency
  programs.spicetify = {
    enable = true;

    # Basic extensions
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
      hidePodcasts
    ];

    # Use Bloom theme - Microsoft Fluent Design inspired
    theme = spicePkgs.themes.bloom;
    colorScheme = "comfy";
  };
}
