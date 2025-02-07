{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.sblatt = { inputs, ... }: { imports = with inputs; [
      self.homeModules.top-level
    ]; };
  };
}