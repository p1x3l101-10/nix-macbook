{ ... }:

{
  imports = [
    ./nix.nix
    ./shell.nix
    ./zoxide.nix
  ];
  home.stateVersion = "24.11";
}