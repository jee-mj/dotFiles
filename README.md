# 👋 jee-mj's dotfiles

## Now with 100% more flakes

### current status: virtualisation STILL does not work

## Yet Another dotFiles Repository

These are my dotFiles for NixOS.

Anyone can use these to build my preferred working environment on a workstation using AMD CPU with NVIDIA GPU.

### Configuration

|           | System | Home     |
|-----------|--------|----------|
| directory | `.nix` | `.flake` |

To change the base system settings (e.g. hardware configuration, system environment packages), use the `.nix` folder. To change anything else, use the `.flake` folder.

### Usage

Prior to activating the configuration, either change the users or create two users: `mj` and `vim`.

To clone the repository, run the following command:

```bash
nix run nispkgs#git clone https://github.com/jee-mj/dotFiles.git ~/dotFiles
```

To activate the configuration, run the following command:

```bash
sudo nixos-rebuild boot --flake ~/dotFiles
```

Lastly, to switch to the new configuration, run the following command:

```bash
sudo reboot
```

## 🙏
