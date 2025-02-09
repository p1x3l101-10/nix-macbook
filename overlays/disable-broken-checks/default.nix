{ lib, ... }:

final: prev:

lib.internal.nixpkgs-tools.disableChecks {
  inherit prev;
  packageList = [
    "xmlto"
  ];
  pythonPackageList = [
    "pytest-xdist"
  ];
}