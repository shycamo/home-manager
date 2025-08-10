# flake.nix
{
  description = "ShyCamo Home-Manager config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  } @ inputs: let
    username = "ash";
    hostname = "shitheap";

    homeConfigUserString =
      if username == "unknown_username"
      then abort "Please replace \"unknown_username\" in flake.nix with your actual username."
      else "${username}@${hostname}";

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});

    # I have no fucking idea what this means but it seems important so don't touch it
    stateVersion = "22.11";

  in {
    packages = genSystems (system: {
      homeConfigurations.${homeConfigUserString} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs.${system};
        modules = [./home.nix];
        extraSpecialArgs =
          inputs
          // {
            inherit username stateVersion;
          };
      };
    });
  };
}
