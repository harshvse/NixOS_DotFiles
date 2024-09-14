{config, pkgs, ...}:

{
  config = {
    programs.git = {
      enable = true;
      userName = "harshvse";
      userEmail = "harshvse@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
