{ config, pkgs, inputs, ... }:

{
  # Zen Browser configuration
  home.packages = [
    # Use beta version (twilight had archive issues)
    inputs.zen-browser.packages.${pkgs.system}.beta
  ];

  # Set zen-browser as default browser using xdg.mimeApps
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-browser.desktop";
      "x-scheme-handler/http" = "zen-browser.desktop";
      "x-scheme-handler/https" = "zen-browser.desktop";
      "x-scheme-handler/about" = "zen-browser.desktop";
      "x-scheme-handler/unknown" = "zen-browser.desktop";
    };
  };

  # Optional: Add zen-browser policies (uncomment if needed)
  # home.file.".zen/policies/policies.json".text = builtins.toJSON {
  #   policies = {
  #     DisableAppUpdate = true;
  #     DisableTelemetry = true;
  #     DisableFirefoxStudies = true;
  #     DisablePocket = true;
  #   };
  # };
}
