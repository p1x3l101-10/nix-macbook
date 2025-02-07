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
  supportedSystems = [ "aarch64-darwin" ];
  outputs-builder = channels: {
    formatter = channels.nixpkgs.nixpkgs-fmt;
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
