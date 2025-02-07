{ pkgs, ... }:

{
  imports = [
    ../../home/base/nix.nix # nix package stuff
  ];
  system.stateVersion = 6;
}