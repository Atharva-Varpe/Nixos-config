{ config, pkgs, ... }:

{
  # Discord with nixcord for Vencord configuration
  programs.nixcord = {
    enable = true; # This also installs Discord automatically
    
    # Custom CSS for Catppuccin Mocha theme
    quickCss = ''
      /* Catppuccin Mocha Discord Theme */
      
      /* Root color variables */
      .theme-dark {
        --ctp-rosewater: #f5e0dc;
        --ctp-flamingo: #f2cdcd;
        --ctp-pink: #f5c2e7;
        --ctp-mauve: #cba6f7;
        --ctp-red: #f38ba8;
        --ctp-maroon: #eba0ac;
        --ctp-peach: #fab387;
        --ctp-yellow: #f9e2af;
        --ctp-green: #a6e3a1;
        --ctp-teal: #94e2d5;
        --ctp-sky: #89dceb;
        --ctp-sapphire: #74c7ec;
        --ctp-blue: #89b4fa;
        --ctp-lavender: #b4befe;
        --ctp-text: #cdd6f4;
        --ctp-subtext1: #bac2de;
        --ctp-subtext0: #a6adc8;
        --ctp-overlay2: #9399b2;
        --ctp-overlay1: #7f849c;
        --ctp-overlay0: #6c7086;
        --ctp-surface2: #585b70;
        --ctp-surface1: #45475a;
        --ctp-surface0: #313244;
        --ctp-base: #1e1e2e;
        --ctp-mantle: #181825;
        --ctp-crust: #11111b;
      }
      
      /* Apply Catppuccin Mocha colors */
      .theme-dark {
        --background-primary: var(--ctp-base);
        --background-secondary: var(--ctp-mantle);
        --background-secondary-alt: var(--ctp-crust);
        --background-tertiary: var(--ctp-crust);
        --background-accent: var(--ctp-surface0);
        --background-floating: var(--ctp-mantle);
        --background-mobile-primary: var(--ctp-base);
        --background-mobile-secondary: var(--ctp-mantle);
        --background-modifier-hover: var(--ctp-surface0);
        --background-modifier-active: var(--ctp-surface1);
        --background-modifier-selected: var(--ctp-surface2);
        --background-modifier-accent: var(--ctp-surface1);
        --text-normal: var(--ctp-text);
        --text-muted: var(--ctp-subtext1);
        --text-faint: var(--ctp-subtext0);
        --text-positive: var(--ctp-green);
        --text-warning: var(--ctp-yellow);
        --text-danger: var(--ctp-red);
        --text-brand: var(--ctp-blue);
        --text-link: var(--ctp-blue);
        --channels-default: var(--ctp-subtext0);
        --channel-icon: var(--ctp-subtext0);
        --interactive-normal: var(--ctp-subtext1);
        --interactive-hover: var(--ctp-text);
        --interactive-active: var(--ctp-text);
        --interactive-muted: var(--ctp-overlay0);
        --header-primary: var(--ctp-text);
        --header-secondary: var(--ctp-subtext1);
        --scrollbar-thin-thumb: var(--ctp-surface2);
        --scrollbar-thin-track: transparent;
        --scrollbar-auto-thumb: var(--ctp-surface2);
        --scrollbar-auto-track: var(--ctp-surface1);
      }
      
      /* Enhanced message styling */
      .message-2CShn3 {
        border-radius: 8px;
        padding: 8px;
        margin: 2px 0;
        background: rgba(69, 71, 90, 0.3);
        backdrop-filter: blur(5px);
      }
      
      .message-2CShn3:hover {
        background: rgba(88, 91, 112, 0.4);
      }
      
      /* Better scrollbars with Catppuccin colors */
      ::-webkit-scrollbar {
        width: 8px;
      }
      
      ::-webkit-scrollbar-track {
        background: var(--ctp-mantle);
        border-radius: 4px;
      }
      
      ::-webkit-scrollbar-thumb {
        background: var(--ctp-surface2);
        border-radius: 4px;
      }
      
      ::-webkit-scrollbar-thumb:hover {
        background: var(--ctp-overlay0);
      }
      
      /* Glassmorphism effect for sidebars */
      .sidebar-1tnWFu {
        backdrop-filter: blur(10px);
        background: rgba(24, 24, 37, 0.85);
        border-radius: 0 12px 12px 0;
      }
      
      /* Better user popouts */
      .userPopout-2j1gM4 {
        border-radius: 16px;
        backdrop-filter: blur(20px);
        background: var(--ctp-mantle);
        border: 1px solid var(--ctp-surface0);
        box-shadow: 0 8px 32px rgba(17, 17, 27, 0.5);
      }
      
      /* Enhanced server list */
      .guilds-2JjMmN {
        background: var(--ctp-mantle);
        backdrop-filter: blur(10px);
      }
      
      /* Server icons with Catppuccin accent colors */
      .wrapper-3kah-n .wrapper-1S43wv {
        border-radius: 50%;
        transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
      }
      
      .wrapper-3kah-n .wrapper-1S43wv:hover {
        border-radius: 30%;
        box-shadow: 0 0 10px var(--ctp-mauve);
      }
      
      /* Catppuccin accent colors for various elements */
      .selected-3c5x7n, .clickable-1bVtEA:hover {
        background-color: var(--ctp-surface1) !important;
      }
      
      /* Enhanced chat input */
      .scrollableContainer-15eg7h {
        border-radius: 12px;
        backdrop-filter: blur(10px);
        background: rgba(49, 50, 68, 0.8);
        border: 1px solid var(--ctp-surface1);
      }
      
      /* Better emoji picker */
      .emojiPicker-6YCk8a {
        border-radius: 16px;
        backdrop-filter: blur(20px);
        background: var(--ctp-mantle);
        border: 1px solid var(--ctp-surface0);
        box-shadow: 0 8px 32px rgba(17, 17, 27, 0.5);
      }
      
      /* Role colors using Catppuccin palette */
      .role-2TIOKu {
        background: var(--ctp-surface1);
        border: 1px solid var(--ctp-surface2);
      }
      
      /* Enhanced buttons */
      .lookFilled-1h1y05.colorBrand-2M3O3N {
        background-color: var(--ctp-blue);
      }
      
      .lookFilled-1h1y05.colorBrand-2M3O3N:hover {
        background-color: var(--ctp-lavender);
      }
      
      .lookFilled-1h1y05.colorGreen-3y-Z79 {
        background-color: var(--ctp-green);
      }
      
      .lookFilled-1h1y05.colorRed-rQXKgM {
        background-color: var(--ctp-red);
      }
      
      /* Online status indicators */
      .status-2zcSVk[data-status="online"] {
        background-color: var(--ctp-green);
      }
      
      .status-2zcSVk[data-status="idle"] {
        background-color: var(--ctp-yellow);
      }
      
      .status-2zcSVk[data-status="dnd"] {
        background-color: var(--ctp-red);
      }
      
      .status-2zcSVk[data-status="streaming"] {
        background-color: var(--ctp-mauve);
      }
      
      /* Smooth animations */
      * {
        transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
      }
    '';
    
    config = {
      useQuickCss = true;
      frameless = false;
      
      # Vencord plugins configuration - simplified for now
      plugins = {
        # Essential plugins only
        # More plugins can be enabled after verifying available names
      };
    };
  };

  # Additional packages (Vesktop as alternative)
  home.packages = with pkgs; [
    vesktop
    nodejs
  ];
}