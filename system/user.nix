{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users.root = {
      initialHashedPassword = "$6$VwSaf8Adaj5V0Wj9$3BTzPxLRJbvAsXcV6QibXyRVmoDtzJlByxE3VEo.Jt96ReL4LGd/SnV3wywP1bbLz2U2tZTa65wGlho0DvdhQ1";
    };
    users.${config.machine.userName} = {
      inherit (config.machine) hashedPassword shell;
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" ];
    };
  };
}
