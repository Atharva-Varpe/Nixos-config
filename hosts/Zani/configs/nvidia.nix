{ config, pkgs, ... }:

{
  # Enable proprietary NVIDIA drivers and disable nouveau
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false; # Use proprietary driver
    nvidiaSettings = true;
    prime = {
      # Enable NVIDIA PRIME for hybrid graphics
      sync.enable = false;
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";    # Common for Alder Lake iGPU, check with lspci if needed
      nvidiaBusId = "PCI:1:0:0";   # Common for laptop dGPU, check with lspci if needed
    };
  };

  # Blacklist nouveau driver
  boot.blacklistedKernelModules = [ "nouveau" ];
}
