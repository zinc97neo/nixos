{ pkgs, config, ... }:
let
  user = "${config.machine.userName}";
in
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
    greetd =
      let
        session = {
          command = "niri";
          user = user;
        };
      in
      {
        enable = true;
        settings = {
          terminal.vt = 1;
          default_session = session;
          initial_session = session;
        };
      };
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
