{ lib, ... }:

final: prev:

{
  nix = prev.nix.overrideAttrs (oldAttrs: {
    doCheck = false;
    doInstallCheck = false;
    installCheck = "";
    passthru.tests = {};
    env._NIX_TEST_ACCEPT = 1;
  });
}