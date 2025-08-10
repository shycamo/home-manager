These are the config files I will be using on my Fedora KDE system with Nix installed, specifically with Home Manager for managing user packages. They were designed to be added to the system with my install script that I made to manage everything for me, however they are available here if you want them for your own, and I will keep this repo available so I can keep updating it if I need the files anywhere else.

# Adding them to your own system
If you are on NixOS, you can remove the line ``targets.genericLinux.enable = true;`` from ``home.nix``.
Additionally, change ``homeConfigUserString`` in ``flake.nix`` to be equal to
``username``.

If you want to add this configuration to a git repository, create one (for example, on github) and then link it up to this folder by running:

```shell,
git remote add origin https://github.com/your-username/repo-name && git push -u origin main
```

(``git remote rm origin`` is also useful if you accidentally add the wrong url)

To add them to your system, run the following commands:
```shell,
mkdir ~/home-manager-config && cd ~/home-manager-config
nix flake init --template github:shycamo/home-manager --extra-experimental-features nix-command --extra-experimental-features flakes
home-manager switch --flake . --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Known issues
If you're on Fedora like me, SELinux is enabled by default, and it breaks Nix if installed using the official installer for multiple users. You can get around this if you nstall Nix using the following command from DeterminateSystems and their Nix version:

```shell,
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```
