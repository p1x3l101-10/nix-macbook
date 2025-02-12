{ ... }:

{
  nix-homebrew.prefixes."/private/var/tmp/homebrew".brews = [{
    name = "syncthing";
    restart_service = true;
  }];
}
