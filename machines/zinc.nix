{ pkgs, ... }:
{
  imports = [
    ./common
  ];
  machine = {
    userName = "zinc";
    userEmail = "zinc97neo@proton.me";
    hashedPassword = "$6$VwSaf8Adaj5V0Wj9$3BTzPxLRJbvAsXcV6QibXyRVmoDtzJlByxE3VEo.Jt96ReL4LGd/SnV3wywP1bbLz2U2tZTa65wGlho0DvdhQ1";
    terminal = "alacritty";
    editor = "hx";
    browser = "firefox";
    shell = pkgs.bash;
    wallpaper = ../wallpaper/default.png;
  };
}
