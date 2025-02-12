{ ... }:

{
  imports = [
    ./nix.nix
    ./shell.nix
    ./zoxide.nix
  ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
