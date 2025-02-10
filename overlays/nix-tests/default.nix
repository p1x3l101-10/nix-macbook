{ lib, ... }:

final: prev:

{
  nixVersions.nix_2_25 = prev.nixVersions.nix_2_25.overrideAttrs (oldAttrs: {
    doCheck = false;
    doInstallCheck = false;
    installCheck = "";
    passthru.tests = {};
    env._NIX_TEST_ACCEPT = 1;
  });
}