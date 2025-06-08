{ config, pkgs, lib, ... }:

{
  # GNOME configuration through dconf
  dconf.settings = {
    # Desktop interface settings
    "org/gnome/desktop/interface" = {
      # Font settings (adjust sizes as needed)
      font-name = "Cantarell 11";              # Main UI font
      document-font-name = "Cantarell 11";     # Document font
      monospace-font-name = "JetBrains Mono 10"; # Terminal/code font

      # Text scaling factor (equivalent to changing font size in GNOME Tweaks)
      # Common values:
      # 1.0  = 100% (default)
      # 1.15 = 115% (slightly larger)
      # 1.25 = 125% (medium)
      # 1.5  = 150% (large)
      # 2.0  = 200% (very large)
      text-scaling-factor = 1.25;  # Adjust this value as needed

      # Theme settings
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
      cursor-theme = "Adwaita";

      # Font rendering settings
      font-antialiasing = "grayscale";  # Options: "none", "grayscale", "rgba"
      font-hinting = "slight";          # Options: "none", "slight", "medium", "full"

      # Optional: Clock format
      clock-format = "12h";  # or "24h"

      # Optional: Show battery percentage
      show-battery-percentage = true;
    };

    # Window manager font settings
    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Cantarell Bold 11";
    };

    # Legacy applications font settings (for older apps)
    "org/gnome/settings-daemon/plugins/xsettings" = {
      antialiasing = "grayscale";
      hinting = "slight";
    };

    # Optional: Terminal font settings (if using GNOME Terminal)
    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      font = "JetBrains Mono 11";
      use-system-font = false;
    };
  };

  # Install GNOME utilities
  home.packages = with pkgs; [
    gnome-tweaks      # For manual font/scaling adjustments
    dconf-editor      # For advanced dconf editing
    gnome-extension-manager  # For managing GNOME extensions
  ];
}
