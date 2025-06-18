# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  documentation.nixos.enable = false;

  nix = {
    settings = {
      warn-dirty= false;
      experimental-features= "nix-command flakes";
      auto-optimise-store = true;
      download-buffer-size = 99999999;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1v"
        "python-2.17.18.7"
      ];
    };
  };

  # Bootloader.
  boot = {
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.efiSupport = true;
    };
  };

  networking = {
    hostName = "highpointe";
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
      "1.0.0.1"
      "8.4.4.4"
    ];
    networkmanager.wifi.powersave = true;
  };

  hardware = {
    bluetooth.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reave = {
    isNormalUser = true;
    description = "Me";
    shell = pkgs.zsh;
    home = "/home/reave";
    extraGroups = [ "networkmanager" "wheel" "flatpak" "disk" "qemu" "audio" "video" "root" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #hyprpanel deps
    ags
    wireplumber
    libgtop
    bluez                             # bluetooth 
    wl-clipboard
    cliphist
    upower
    gvfs
    gtksourceview3
    upower
    #hyprland deps
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    #other
    git
    neovim
    networkmanagerapplet
    power-profiles-daemon
    manix                             # documentation search for nix pkg options
  ];

  # Some programs need SUID wrappers, can be configured further or are
    programs.hyprland = {
      enable = true;
        xwayland.enable = true;
      };

    programs.zsh.enable = true;
    
    xdg.portal = {
      enable = true;
      extraPortals = [
          pkgs.xdg-desktop-portal-hyprland
          pkgs.xdg-desktop-portal-gtk
        ];
      config.common.default = "hyprland";
    };	

    services = {
      # Configure keymap in X11
      xserver.xkb = {
        layout = "us";
        variant = "";
      };
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
      gnome = {
        gnome-keyring.enable = true;
      };
      greetd = {
        enable = true;
        settings ={
          default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
            user = "reave";
          };
        };
      };

      blueman.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
      openssh.enable = true;
      flatpak.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
      fwupd.enable = true; #framework laptop bios distribution: fwupdmgr update 
    };

  # List services that you want to enable:
  security = {
	  rtkit.enable = true;
    pam.services.greetd.enableGnomeKeyring = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
