{ ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
  };
  home.shellAliases = {
    ls = "ls --color";
    grep = "grep --color=auto";
    ssh-home = "ssh pixel@166.113.94.161 -p 7003"
  };
}