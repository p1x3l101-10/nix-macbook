inputs: let
  lib = inputs.snowfall-lib.mkLib {
    inherit inputs;
    src = ./.;
  };
in lib.mkFlake {
  systems.modules.darwin = with inputs; [
    nix-homebrew.darwinModules.nix-homebrew
    nix-darwin.darwinModules.nix-darwin
    home-manager.darwinModules.home-manager
  ];
  supportedSystems = import inputs.systems;
  outputs-builder = channels: {
    formatter = channels.nixpkgs.nixpkgs-fmt;
    packages = with inputs; {
      inherit (home-manager.packages.aarch64-darwin) home-manager;
      inherit (nix-darwin.packages.aarch64-darwin) darwin-rebuild;
      nix = (import ./modules/home/base/nix.nix { inherit lib; pkgs = (nixpkgs.legacyPackages.aarch64-darwin); inputs = {}; }).nix.package;
    };
  };
  channels-config = {
    contentAddressedByDefault = true;
    # List of unfree packages to allow
    # I could enable them all using one config, but that seems unsafe...
    # Make packages work using this one simple trick, Stallman hates him!
    allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
    ];
  };
}
