{ inputs, ... }:

{
  imports = with inputs; (with self.homeModules [
    base
  ]);
}