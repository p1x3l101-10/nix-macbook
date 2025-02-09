{ lib, ext }:

{ prev, name }:

{ 
  "${name}" = prev.${name}.overrideAttrs (oldAttrs: {
    doInstallCheck = false;
    doCheck = false;
  });
}