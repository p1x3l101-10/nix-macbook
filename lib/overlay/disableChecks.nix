{ lib, ext }:

{ prev
, extraMerge ? []
, packageList ? []
, pythonPackageList ? []
}@args:

let
  disableForEach = list: lib.lists.forEach (x: lib.internal.overlay.disableCheck prev x) list;
in

lib.nixos-home.attrsets.mergeAttrs (disableForEach [
  # Normal packages
]) ++ [
  # Python packages
  (lib.modules.mkIf (pythonPackageList != []) {
    pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
      (py-final: py-prev: lib.nixos-home.attrsets.mergeAttrs (disableForEach args.pythonPackageList))
    ];
  })
  # Extra stuff to merge (custom check rules)
] ++ extraMerge