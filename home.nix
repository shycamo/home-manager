# home.nix
{
  pkgs,
  lib,
  username,
  stateVersion,
  ...
}: {
  imports = [];

  # Assuming you're not using nixOS
  targets.genericLinux.enable = true;

  home = {
    inherit username stateVersion;
    homeDirectory = "/home/${username}";
  };

  # list where you can specify unfree packages to allow
  nixpkgs.config.allowUnfree = true;

  # List packages you want to install here, 4 spaces from the line start
  # Don't worry if they don't initially show up in your launcher, they will after a few minutes
  home.packages = with pkgs; [
    floorp
    discord
    spotify
    obs-studio
    streamcontroller
    azahar
    vlc

  ];
}
