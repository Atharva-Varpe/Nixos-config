{ config, pkgs, ... }:

{
  # Font configuration
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # System fonts (GNOME default)
    cantarell-fonts

    # JetBrains Mono font family
    jetbrains-mono

    # Additional programming fonts (optional)
    fira-code
    fira-code-symbols

    # Font management utilities
    font-manager
  ];

  # Optional: Set font preferences
  xdg.configFile."fontconfig/conf.d/10-hm-fonts.conf".text = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
      <!-- Set JetBrains Mono as preferred monospace font -->
      <alias>
        <family>monospace</family>
        <prefer>
          <family>JetBrains Mono</family>
          <family>Fira Code</family>
          <family>Source Code Pro</family>
        </prefer>
      </alias>

      <!-- Improve font rendering -->
      <match target="font">
        <edit name="antialias" mode="assign">
          <bool>true</bool>
        </edit>
        <edit name="hinting" mode="assign">
          <bool>true</bool>
        </edit>
        <edit name="hintstyle" mode="assign">
          <const>hintslight</const>
        </edit>
        <edit name="rgba" mode="assign">
          <const>rgb</const>
        </edit>
        <edit name="lcdfilter" mode="assign">
          <const>lcddefault</const>
        </edit>
      </match>
    </fontconfig>
  '';
}
