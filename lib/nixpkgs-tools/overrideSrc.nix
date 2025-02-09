{ lib, ext }:

{ prev, name, src }:

{ 
  "${name}" = prev.${name}.overrideAttrs (oldAttrs: {
    inherit src;
  });
}