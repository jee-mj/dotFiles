# 👋 jee-mj's dotfiles

## Now with 100% more flakes

### current status: virtualisation STILL does not work

## Yet Another dotFiles Repository

These are my dotFiles for NixOS.

Anyone can use these to build my preferred working environment on a workstation using AMD CPU with NVIDIA GPU.

You will have to generate a lockfile if you don't have one.

### Configuration

|           | System | Home     |
|-----------|--------|----------|
| directory | `.nix` | `.flake` |

To change the base system settings (e.g. hardware configuration, system environment packages), use the `.nix` folder. To change anything else, use the `.flake` folder.

### Usage

Prior to activating the configuration, either change the users or create two users: `mj` and `vim`.

To clone the repository, run the following command:

```bash
nix run nispkgs#git clone https://github.com/jee-mj/dotFiles.git ~/dotFiles --experimental-features 'nix-command flakes'
```

To activate the configuration, run the following command:

```bash
cp /etc/nixos/hardware-configuration.nix ~/dotFiles/hardware-configuration.nix
sudo nixos-rebuild boot --flake ~/dotFiles --experimental-features 'nix-command flakes'
```

Lastly, to switch to the new configuration, run the following command:

```bash
sudo reboot
```

PS: Once you're in, you can clean up the installation by running the following command:

```bash
nixgc
```

#### LUKS Encryption

If you have full disk encryption enabled, you will need to uncomment and replace `<uuid>` at line 8 of `.nix/boot.nix` with the UUID listed in your `/etc/nixos/configuration.nix` file.

It doesn't matter if you forgot to do this before rebooting, you can simply reboot back into the previous generation, make the changes, and run the `nixos-rebuild` command again.

#### `nixos-rebuild switch`

I don't recommend using `nixos-rebuild switch` because it can fail sometimes. `nixos-rebuild boot` is more reliable, and way cleaner.

## 🙏
