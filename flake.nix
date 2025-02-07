{
  inputs = {
    nixos-home.url = "github:p1x3l101-10/nixos";
    nixpkgs.follows = "nixos-home/nixpkgs";
    snowfall-lib.follows = "nixos-home/snowfall-lib";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
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
}
