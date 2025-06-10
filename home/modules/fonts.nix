{ config, pkgs, ... }:

{
  # Font configuration
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # System fonts (GNOME default)
    cantarell-fonts

    # JetBrains Mono fonts
    jetbrains-mono                    # Regular JetBrains Mono
    nerd-fonts.jetbrains-mono        # JetBrains Mono Nerd Font (includes icons)

    # Additional programming fonts (optional)
    fira-code
    fira-code-symbols

    # Font management utilities
    font-manager
  ];

  # Font configuration via fontconfig
  xdg.configFile."fontconfig/conf.d/10-custom-fonts.conf".text = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
      <!-- Set JetBrains Mono as preferred monospace font -->
      <alias>
        <family>monospace</family>
        <prefer>
          <family>JetBrains Mono</family>
          <family>JetBrainsMono Nerd Font Mono</family>
          <family>JetBrainsMono Nerd Font</family>
          <family>Fira Code</family>
          <family>DejaVu Sans Mono</family>
        </prefer>
      </alias>

      <!-- Override system monospace font -->
      <match target="pattern">
        <test qual="any" name="family">
          <string>monospace</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
          <string>JetBrains Mono</string>
        </edit>
      </match>

      <!-- Set Cantarell as preferred sans-serif font -->
      <alias>
        <family>sans-serif</family>
        <prefer>
          <family>Cantarell</family>
          <family>DejaVu Sans</family>
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
