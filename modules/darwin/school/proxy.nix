{ ... }:

{
  homebrew.nix-homebrew.prefixes."/private/var/tmp/homebrew".brews = [{
    name = "ssh-proxy";
    restart_service = true;
  }];
}