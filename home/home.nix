{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  # Home Manager is managed by NixOS module integration

  # Import all the modules
  imports = [
    ./modules/fonts.nix
    ./modules/gnome.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/utilities.nix
    ./programs/vscode.nix
    ./programs/kitty.nix
    ./programs/games.nix
    ./programs/zen-browser.nix
    ./programs/discord.nix
    ./programs/spotify.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Development tools
    nodejs
    python3
    rustc
    cargo
    gcc

    # Utilities
    tree
    unzip
    zip
    ripgrep
    fd
    bat
    eza
    python3Packages.pygments

    # Media
    vlc

    # System monitoring
    fastfetch
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "24.05";
}
