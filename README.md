# Luna's NixOS Configuration

This repository contains my personal NixOS configuration using flakes and home-manager.

## Structure

```
.
├── flake.nix                 # Main flake configuration
├── home/
│   ├── home.nix             # Home-manager config for desktop (Zani)
│   ├── home-server.nix      # Home-manager config for server (Caramel)
│   ├── modules/             # Home-manager modules
│   │   ├── git.nix          # Git configuration
│   │   ├── starship.nix     # Starship prompt configuration
│   │   └── zsh.nix          # ZSH with Oh My Zsh configuration
│   └── programs/            # Program-specific configurations
│       ├── games.nix        # Gaming setup (Steam, Mindustry, etc.)
│       ├── kitty.nix        # Kitty terminal configuration
│       └── vscode.nix       # VS Code configuration
└── hosts/
    ├── Zani/                # Laptop configuration
    │   ├── configuration.nix
    │   └── hardware-configuration.nix
    └── Caramel/             # Server configuration
        └── configuration.nix
```

## Hosts

- **Zani**: Main laptop with full desktop environment (GNOME), development tools, and gaming setup
- **Caramel**: Server configuration with minimal packages and services

## Features

### Desktop (Zani)
- GNOME desktop environment
- ZSH with Oh My Zsh and Starship prompt
- Development tools (VS Code, Git, Node.js, Python, Rust)
- Kitty terminal with Dracula theme
- Gaming setup (Steam, Mindustry, Lutris)
- Modern CLI tools (bat, eza, ripgrep, fd)

### Server (Caramel)
- Minimal server setup
- Docker and Docker Compose
- SSH hardening
- Automatic updates and garbage collection
- Essential CLI tools

## Installation

### First time setup

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/luna
   cd ~/luna
   ```

2. Update the configuration:
   - Edit `home/modules/git.nix` with your Git credentials
   - Add your SSH public keys to `hosts/Caramel/configuration.nix`
   - Adjust timezone in both host configurations

3. For Zani (laptop):
   ```bash
   sudo nixos-rebuild switch --flake .#Zani
   ```

4. For Caramel (server):
   ```bash
   sudo nixos-rebuild switch --flake .#Caramel
   ```

### Updating

To update your system:
```bash
# Update flake inputs
nix flake update

# Rebuild system
sudo nixos-rebuild switch --flake .

# Update home-manager separately if needed
home-manager switch --flake .
```

### Useful aliases (included in ZSH config)

- `nrs`: `sudo nixos-rebuild switch --flake .`
- `nrt`: `sudo nixos-rebuild test --flake .`
- `hms`: `home-manager switch --flake .`

## Customization

### Adding new programs

1. Create a new file in `home/programs/`
2. Add the import to `home/home.nix`
3. Rebuild with `nrs`

### Adding system packages

Add packages to `environment.systemPackages` in the respective host configuration.

### Adding user packages

Add packages to `home.packages` in the home-manager configuration.

## Notes

- The configuration uses the unstable channel for latest packages
- Flakes are enabled system-wide
- Home-manager is integrated into the system configuration
- The server configuration includes automatic updates and garbage collection
