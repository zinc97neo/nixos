{
  home.file = {
    ".ssh/.id_rsa" = {
      source = ./private;
      onChange = ''cat ~/.ssh/.id_rsa > ~/.ssh/id_rsa && chmod 400 ~/.ssh/id_rsa'';
    };
    ".ssh/id_rsa.pub" = {
      source = ./public;
    };
  };
  programs.git = {
    enable = true;
    userName = "zinc";
    userEmail = "zinc97neo@proton.me";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
    };
    lfs = {
      enable = true;
    };
  };
}
