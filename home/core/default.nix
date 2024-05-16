{ pkgs, ... }: {
  imports = [
    ./dev.nix
    ./shell
  ];
  home.packages = with pkgs; [
    # Interactively filter its input using fuzzy searching, not limit to filenames.
    fzf
  ];
  programs = {
    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      # do not enable aliases in nushell!
      enableNushellIntegration = false;
      git = true;
      icons = true;
    };
    # a cat(1) clone with syntax highlighting and Git integration.
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
      themes = {
        # https://github.com/catppuccin/bat
        catppuccin-mocha = {
          src = ./themes/bat;
          file = "Macchiato.tmTheme";
        };
      };
    };
    # A command-line fuzzy finder
    fzf = {
      enable = true;
      # https://github.com/catppuccin/fzf
      # catppuccin-mocha
      colors = {
        "bg+" = "#363a4f";
        "bg" = "#24273a";
        "spinner" = "#f4dbd6";
        "hl" = "#ed8796";
        "fg" = "#cad3f5";
        "header" = "#ed8796";
        "info" = "#c6a0f6";
        "pointer" = "#f4dbd6";
        "marker" = "#f4dbd6";
        "fg+" = "#cad3f5";
        "prompt" = "#c6a0f6";
        "hl+" = "#ed8796";
      };
    };
    # zoxide is a smarter cd command, inspired by z and autojump.
    # It remembers which directories you use most frequently,
    # so you can "jump" to them in just a few keystrokes.
    # zoxide works on all major shells.
    #
    #   z foo              # cd into highest ranked directory matching foo
    #   z foo bar          # cd into highest ranked directory matching foo and bar
    #   z foo /            # cd into a subdirectory starting with foo
    #
    #   z ~/foo            # z also works like a regular cd command
    #   z foo/             # cd into relative path
    #   z ..               # cd one level up
    #   z -                # cd into previous directory
    #
    #   zi foo             # cd with interactive selection (using fzf)
    #
    #   z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
