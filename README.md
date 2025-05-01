# 👋 jee-mj's dotfiles

## Yet Another dotFiles Repository

### current status: unusable without VS code
These are my dotFiles for NixOS.

Anyone can use these to build my preferred working environment on a workstation using AMD CPU with NVIDIA GPU and much more.

### Configuration

|      | System  | Home   |
|------|---------|--------|
| dir  | `flake` | `home` |

To change the base system settings (e.g. hardware configuration, system environment packages), use the `.nix` folder. To change anything else, use the `.flake` folder.

### Usage

Prior to activating the configuration, either change the users or create two users: `mj` and `vim`.

To clone the repository, run the following command:

```bash
nix run nispkgs#git clone https://github.com/jee-mj/dotFiles.git ~/dotFiles
```

To activate the configuration, run the following command:

```bash
sudo nixos-rebuild boot --flake ~/dotFiles#URIEL-LAB
# an error message may be returned on missing features
# follow the prompt to add flags at the start of options
# e.g. sudo nixos-rebuild boot --<EXTRA-OPTIONS> --flake ~/dotFiles#URIEL-LAB
```

Lastly, to switch to the new configuration, run the following command:

```bash
sudo reboot
```

## 🙏

Thank you for trying to engineer or reverse-engineer this configuration. My clones will take over ze world! 👹
