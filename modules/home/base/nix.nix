{ inputs, pkgs, lib, ... }:
let
  pfx = "/private/var/tmp/nix";
in {
  nix = {
    package = pkgs.nixVersions.latest.override {
      storeDir = "${pfx}/store";
      stateDir = "${pfx}/var";
      confDir = "${pfx}/etc";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      substituters = lib.mkForce []; # Diff nix store dir
      # Jobs w/ 2 cores each, for 8 cores used in total
      cores = 2;
      max-jobs = 4;
      # I dont get nice things...
      substitute = false;
      # Preserve build deps
      keep-outputs = true;
      keep-derivations = true;
    };
    registry = inputs.nixos-home.lib.confTemplates.registry inputs;
  };
}