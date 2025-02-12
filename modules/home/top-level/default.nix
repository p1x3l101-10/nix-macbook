{ lib, inputs, ... }:

{
  # Load all files from homeManager without the HM binary
  imports = with inputs; (with self.homeModules; [
    base
  ]);
  programs.home-manager.enable = lib.mkForce true;
}
