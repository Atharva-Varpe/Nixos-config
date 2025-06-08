{ config, pkgs, ... }:

{
  # Bootloader configuration - Using GRUB for better dual boot support
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Additional GRUB configuration with manual Windows entry
  boot.loader.grub.extraConfig = ''
    # Enable Windows detection
    GRUB_DISABLE_OS_PROBER=false
  '';

  # Manual Windows boot entry
  boot.loader.grub.extraEntries = ''
    menuentry "Windows 11" {
      insmod part_gpt
      insmod fat
      insmod search_fs_uuid
      insmod chain
      search --fs-uuid --set=root 9243-463D
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';

  # Ensure os-prober can detect Windows
  boot.loader.grub.configurationLimit = 10;

  # Optional: systemd-boot alternative (comment out GRUB lines above to use this)
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
}
