{ lib, ... }:

final: prev:

lib.internal.overlay.disableChecks {
  inherit prev;
  packageList = [
    "xmlto"
  ];
  pythonPackageList = [
    "pytest-xdist"
  ];
}
