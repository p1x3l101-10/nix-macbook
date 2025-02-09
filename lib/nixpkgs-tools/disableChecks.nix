{ lib, ext }:

{ prev
, extraMerge ? []
, packageList ? []
, pythonPackageList ? []
, overrideSrc ? []
}@args:

let
  inherit (lib.internal.internal) callLibPrimitive;
  inherit (lib.nixpkgs.lists) forEach;
  disableForEach = list: forEach list (name: (callLibPrimitive ./disableCheck.nix) { inherit prev name; });
  srcForEach = list: forEach list (item: (callLibPrimitive ./overrideSrc.nix) { inherit prev; inherit (item) name src; });
in

lib.internal.attrsets.mergeAttrs (
  (disableForEach args.packageList)
  ++ [
    # Python packages
    (lib.modules.mkIf (pythonPackageList != []) {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (py-final: py-prev: lib.nixos-home.attrsets.mergeAttrs (disableForEach args.pythonPackageList))
      ];
    })
    # Extra stuff to merge (custom check rules)
  ] ++ (srcForEach overrideSrc)
  ++ extraMerge
)