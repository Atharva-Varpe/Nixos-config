{ config, pkgs, ... }:

{
  # Enable Wayland with GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap (works for both X11 and Wayland)
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable automatic login for the user
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "luna";

  # Workaround for GNOME autologin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Enable touchpad support (enabled default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
