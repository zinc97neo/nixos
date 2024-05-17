{ pkgs, ... }:
{
  # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
  sound.enable = false;
  # Disable pulseaudio, it conflicts with pipewire too.
  hardware.pulseaudio.enable = false;
  services = {
    printing.enable = true; # Enable CUPS to print documents.
    geoclue2.enable = true; # Enable geolocation services.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
      enable = false;
      videoDrivers = [ "amdgpu" ];
    };
    v2raya.enable = true;
    blueman.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    getty.autologinUser = "zinc";
    # kmscon = {
    #   enable = true;
    #   extraConfig = ''
    #     font-size=30
    #     palette-black=20, 20, 20
    #     palette-red=210, 15, 57
    #     palette-green=166, 218, 149
    #     palette-yellow=223, 142, 29
    #     palette-blue=127,187,179
    #     palette-cyan=4, 165, 229
    #     palette-light-red=255, 15, 57
    #     palette-light-green=160, 255, 140
    #     palette-light-yellow=255, 222, 29
    #     palette-light-blue=138, 173, 244
    #     palette-light-cyan=44, 199, 229
    #     palette-background=36, 39, 58
    #     palette-foreground=221, 205, 188
    #   '';
    #   extraOptions = "--term xterm-256color --palette custom";
    #   autologinUser = "zinc";
    #   hwRender = true;
    # };
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
            };
          };
        };
      };
    };
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "yes";
        PasswordAuthentication = true;
      };
      openFirewall = true;
    };
  };
  # after sleep, v2raya will be not working,
  # so we need to restart it
  powerManagement.resumeCommands = ''
    ${pkgs.systemd}/bin/systemctl restart v2raya.service
  '';
}   
