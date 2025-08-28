# home.nix
{
  pkgs,
  lib,
  username,
  stateVersion,
  ...
}: {
  imports = [];

  # Set to "true" if you aren't using NixOS
  targets.genericLinux.enable = true;

  home = {
    inherit username stateVersion;
    homeDirectory = "/home/${username}";
  };

  # Enables unfree packages (don't disable for any reason)
  nixpkgs.config.allowUnfree = true;

  # List packages you want to install here, 4 spaces from the line start
  # Don't worry if they don't initially show up in your launcher, they will after a few minutes
  home.packages = with pkgs; [
    # SYSTEM PACKAGES #
    protontricks
    protonvpn-gui
    waydroid
    pfetch
    vlc
    xclicker
    syncthing
    # USER PACKAGES #
    floorp
    discord
    spotify
    obs-studio
    streamcontroller
    blender
    prismlauncher
    heroic
    godot
    
  ];
}
