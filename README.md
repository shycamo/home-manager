These are the config files I will be using on my Fedora KDE system with Nix installed, specifically with Home Manager for managing user packages. They were designed to be added to the system with my install script that I made to manage everything for me, however they are available here if you want them for your own, and I will keep this repo available so I can keep updating it if I need the files anywhere else.

To add them to your system, run the following commands:
```shell,
mkdir -p ~/.config/home-manager
git clone https://github.com/shycamo/home-manager ~/.config/home-manager
nix run home-manager/release-24.05 -- switch --flake ~/.config/home-manager
```

## Known issues
If you're on Fedora like me, SELinux is enabled by default, and it breaks Nix if installed using the official installer for multiple users. You can get around this if you install Nix using the following command from DeterminateSystems and their Nix version:

```shell,
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```
