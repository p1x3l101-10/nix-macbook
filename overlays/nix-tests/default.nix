{ lib, ... }:

final: prev:

{
  nix = prev.nix.overrideAttrs (oldAttrs: {
    doCheck = false;
    doInstallCheck = false;
    installCheck = "";
    passthru.tests = {};
  });
}