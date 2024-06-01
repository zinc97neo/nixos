{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      if [ "$TERM" = "linux" ]; then
          echo -en "\e]P024273A" #black
          echo -en "\e]P87A8478" #darkgrey
          echo -en "\e]P14C3743" #darkred
          echo -en "\e]P9D20F39" #red
          echo -en "\e]P23C4841" #darkgreen
          echo -en "\e]PAA7C080" #green
          echo -en "\e]P3FEA44C" #brown
          echo -en "\e]PBDBBC7F" #yellow
          echo -en "\e]P4384B55" #darkblue
          echo -en "\e]PC7FBBB3" #blue
          echo -en "\e]P5BF2E5D" #darkmagenta
          echo -en "\e]PDD71655" #magenta
          echo -en "\e]P649AEE6" #darkcyan
          echo -en "\e]PE05A1F7" #cyan
          echo -en "\e]P79DA9A0" #lightgrey
          echo -en "\e]PFCAD3F5" #white
      fi
      clear
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
      e = "niri msg action spawn -- kitty hx $(pwd)";
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
