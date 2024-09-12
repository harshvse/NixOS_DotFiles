{config, pkgs, ...}:
let
  shellAlias = {
    ll = "ls -la";
    ".." = "cd ..";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = shellAlias;
  };

  programs.zsh = {
    enable = true;
    shellAliases = shellAlias;
  };
}
