{ lib, ... }:

final: prev:

let
  nixPkg = (import ../../modules/home/base/nix.nix { inherit lib; pkgs = prev; inputs = {}; }).nix.package;
in

{
  nixos-option.override = {
    nix = nixPkg;
  };
}