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
  overrideSrc = [
    {
      name = "xmlto"; src = builtins.fetchGit {
        url = "https://pagure.io/xmlto.git";
        rev = "635dcd5bc84a7b67a3a2050a179d96e1d3050b15 ";
      };
    }
  ];
}