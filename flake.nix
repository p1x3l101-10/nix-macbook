{
  inputs = {
    nixos-home = {
      url = "github:p1x3l101-10/nixos";
      inputs.systems.follows = "systems";
    };
    nixpkgs.follows = "nixos-home/nixpkgs";
    snowfall-lib.follows = "nixos-home/snowfall-lib";
    systems.url = "github:nix-systems/aarch64-darwin";
    darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Homebrew taps
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-services = {
      url = "github:homebrew/homebrew-services";
      flake = false;
    };
    homebrew-unmojang = {
      url = "github:unmojang/homebrew-unmojang";
      flake = false;
    };
    homebrew-personal = {
      url = "github:p1x3l101-10/homebrew-personal";
      flake = false;
    };
  };
  outputs = inputs: import ./outputs.nix inputs;
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
    cores = 2;
    max-jobs = 4;
    # Nonstandard store means no substituters
    # Suppress the warning I get for that
    substitute = false;
  };
}
