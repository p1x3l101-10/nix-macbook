{ lib, ext }:

{ prev
, extraMerge ? []
, packageList ? []
, pythonPackageList ? []
}@args:

let
  disableCheck = lib.internal.internal.callLibPrimitive ./disableCheck.nix;
  disableForEach = list: lib.nixpkgs.lists.forEach list (name: disableCheck { inherit prev name; });
in

lib.internal.attrsets.mergeAttrs ((disableForEach args.packageList
) ++ [
  # Python packages
  (lib.modules.mkIf (pythonPackageList != []) {
    pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
      (py-final: py-prev: lib.nixos-home.attrsets.mergeAttrs (disableForEach args.pythonPackageList))
    ];
  })
  # Extra stuff to merge (custom check rules)
] ++ extraMerge)