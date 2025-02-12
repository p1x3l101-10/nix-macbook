{ inputs, pkgs, config, lib, ... }:

let
  nixConfig = (import ../../home/base/nix.nix { inherit lib inputs pkgs; });
in {
  config = nixConfig // {
    nix.package = lib.mkForce (nixConfig.nix.package);
  };
}