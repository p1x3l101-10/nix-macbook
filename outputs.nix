inputs: let
  lib = inputs.snowfall-lib.mkLib {
    inherit inputs;
    src = ./.;
  };
in lib.mkFlake {
  systems.modules.darwin = with inputs; [
    nix-homebrew.darwinModules.nix-homebrew
    home-manager.darwinModules.home-manager
  ];
  supportedSystems = import inputs.systems;
  outputs-builder = channels: {
    formatter = channels.nixpkgs.nixpkgs-fmt;
    packages = with inputs; {
      inherit (darwin.packages.aarch64-darwin) darwin-rebuild;
      home-manager = home-manager.packages.aarch64-darwin.home-manager.override {
        pkgs.nixos-option = "";
      };
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
