{ lib, ... }:

final: prev:

lib.overlay.disableChecks {
  inherit prev;
  packageList = [
    "xmlto"
  ];
  pythonPackageList = [
    "pytest-xdist"
  ];
}
