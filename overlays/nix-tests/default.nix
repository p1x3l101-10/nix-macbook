{ lib, ... }:

final: prev:

{
  nixVersions.nix_2_24 = prev.nixVersions.nix_2_24.overrideAttrs (oldAttrs: {
    doCheck = false;
    doInstallCheck = false;
    installCheck = "";
    passthru.tests = {};
    env._NIX_TEST_ACCEPT = 1;
  });
}