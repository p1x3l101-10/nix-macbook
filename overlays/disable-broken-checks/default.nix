{ ... }:

final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [(py-final: py-prev: {
    pytest-xdist = py-prev.pytest-xdist.overrideAttrs (oldAttrs: {
      doInstallCheck = false;
      doCheck = false;
    });
  })];
}