{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  security = {
    sudo.wheelNeedsPassword = false;
    wrappers = {
      # Displays keys being pressed on a Wayland session
      wshowkeys =
        {
          setuid = true;
          owner = "root";
          group = "root";
          source = "${pkgs.wshowkeys}/bin/wshowkeys";
        };
    };
  };
}
