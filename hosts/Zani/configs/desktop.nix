{ config, pkgs, ... }:

{
  # Enable Wayland with GNOME
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap (works for both X11 and Wayland)
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Remove automatic login for the user (require password at login)
  services.displayManager.autoLogin.enable = false;

  # Remove workaround for GNOME autologin (not needed if autologin is disabled)
  systemd.services."getty@tty1".enable = true;
  systemd.services."autovt@tty1".enable = true;

  # Enable touchpad support (enabled default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
