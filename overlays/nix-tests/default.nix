{ lib, ... }:

final: prev:

{
  nix = prev.nix.overrideAttrs (oldAttrs: {
    doCheck = false;
    doInstallCheck = false;
    passthru.tests = {};
  });
}