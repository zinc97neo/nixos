<h2 align="center">:snowflake: Zinc's Nix Config :snowflake:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

This repository is home to the nix code that builds my systems:

1. NixOS WSL
2. NixOS Desktop
3. Gentoo Nix

# Install NixOS

Switch to the root user.

```bash
sudo -i
```

## Networking

```bash
systemctl start wpa_supplicant.service
wpa_cli
add_network
set_network 0 ssid "wifi-ssid"
set_network 0 psk "psk"
set_network 0 key_mgmt WPA-PSK
enable_network 0
quit
```

## UEFI

Here’s an example partition scheme for UEFI, using /dev/nvme0n1 as the device.

```bash
cfdisk /dev/nvme0n1
nvme0n1p1 EFI System
nvme0n1p2 Linux swap
nvme0n1p3 Linux filesystem
```

Formatting

```bash
mkfs.fat -F 32 -n boot /dev/nvme0n1p1
mkswap -L swap /dev/nvme0n1p2
mkfs.btrfs -fL nixos /dev/nvme0n1p3
```

## Installation to NVME

Mount the target file system on which NixOS should be installed on /mnt, e.g.

```bash
mount /dev/nvme0n1p3 /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt
mount -o compress=zstd,subvol=root /dev/nvme0n1p3 /mnt
mkdir /mnt/{home,nix,boot}
mount -o compress=zstd,subvol=home /dev/nvme0n1p3 /mnt/home
mount -o compress=zstd,noatime,subvol=nix /dev/nvme0n1p3 /mnt/nix
mount /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2
```
Generating the base configuration.

```bash
nixos-generate-config --root /mnt
```

Go to nix-shell (with git and helix)
```bash
nix-shell -p git helix
```

```bash
hx /mnt/etc/nixos/configuration.nix
hx /mnt/etc/nixos/hardware-configuration.nix
```

example:

hardware-configuration
```nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/483764b6-b561-441b-b7fe-1bbe89dc8174";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/483764b6-b561-441b-b7fe-1bbe89dc8174";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/483764b6-b561-441b-b7fe-1bbe89dc8174";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CBB3-9491";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/80fd8284-e652-4d37-9479-59974963215a"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
```

Installation of the system to the hard disk.

```bash
cd /mnt/etc/nixos
nixos-install --root /mnt --flake .#nixos --no-root-password --show-trace --verbose
```

## Notice

### nmcli

Use nmcli to connect to wifi if you can't connect to the card with wpa_cli after installation.

```bash
nmcli dev wifi list
nmcli dev wifi connect ssid password xxxxxx
```
