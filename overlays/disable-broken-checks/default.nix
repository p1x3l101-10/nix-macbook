{ ... }:

final: prev: {
  python312Packages.pytest-xdist = prev.python312Packages.pytest-xdist.overrideAttrs (oldAttrs: {
    doCheck = false;
  });
}