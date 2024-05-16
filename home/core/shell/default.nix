{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    '';
    shellAliases = {
      h = "sudo -E hx";
      conf = "cd /etc/nixos";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellGlobalAliases = {
      hx = "sudo -E hx";
      h = "hx";
      zj = "zellij";
    };
    initExtra = ''
    '';
    envExtra = ''
      export EDITOR="hx";
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "Aloxaf/fzf-tab"; }
      ];
    };
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
  programs.zellij = {
    enable = true;
  };
  xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
}