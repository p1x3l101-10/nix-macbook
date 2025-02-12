{ pkgs, ... }:

{
  imports = [
    ./nix.nix # nix package stuff
  ];
  system.stateVersion = 5;
}
