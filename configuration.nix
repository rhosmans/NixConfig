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
	tmp.cleanOnBoot = true;
	supportedFilesystems = ["ntfs"];
	loader = {
		efi.canTouchEfiVariables = true;
		efi.efiSysMountPoint = "/boot/efi";
		grub.efiSupport = true;
		grub.device = "nodev";
	};
  };


  networking = {
	hostName = "r-frame";
	networkmanager.enable = true;
	nameservers = [
		"1.1.1.1"
		"8.8.8.8"
		"1.0.0.1"
		"8.4.4.4"
	];
	networkmanager.wifi.powersave = false;
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users._reave = {
    isNormalUser = true;
    description = "Reave";
    extraGroups = [ "networkmanager" "wheel" "flatpak" "disk" "qemu" "audio" "video" "root" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  

  environment.systemPackages = with pkgs; [
	pipewire
	meson
	ninja
	dunst
	libnotify
  	wget
	git
	htop
	obsidian
	zsh			#FuckBash
	oh-my-zsh		#ifykyk
	alacritty		#Terminal
	neovim 			#TextEditor
	vscode			#WorkShenanigans
	firefox			#InternetBrowser
	rofi-wayland 		#AppLauncher
	wl-clipboard		#ClipboardFunctionality
	hyprland		#TilingWindowManager
	yazi			#TerminalFileManager
	xfce.tumbler		#FileManagerThumbnails
	ffmpegthumbnailer	#VideoThumbnails
	gvfs			#TrashSupport
	ladybird		#Browser
	swww			#WallpaperDaemon
#	hyprpanel		#Statusbar
#	thunar			#GUIFileManager		
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  services = {
	flatpak.enable = true;
  };

  xdg.portal = {
	enable = true;
	config.common.default = "*";
	extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };	

  # Some programs need SUID wrappers, can be configured further or are
 programs = {
   hyprland = {
   	enable = true;
   	xwayland.enable = true;
   };
   zsh = {
	enable = true;
	enableCompletion = true;
	enableBashCompletion = true;
	autosuggestions.enable = true;
	syntaxHighlighting.enable = true;
	histSize = 1000;
	ohMyZsh = {
		enable = true;
		theme = "crunch";
		plugins = [
			"kubectl"
			"git"
			"helm"
			"docker"
			"git"
			"sudo"
			"cp"
			"dotenv"
			"gcloud"
			"golang"
			"postgres"
			"yarn"
		];
	};
   };
#    vscode = {
#	enable = true;
#	extensions = with pkgs.vscode-extensions; [];
#    };
#   alacritty = {
#	enable = true;	
#	settings ={
#		font.size = 12;
#		shell.program = "/usr/local/bin/zsh";
#	};	
#   };
#   ladybird.enable = true;
   neovim.enable = true;
   xfconf.enable = true;
   thunar.enable = true;
   firefox.enable = true;
};
   
   users.defaultUserShell = pkgs.zsh;
     

  # List services that you want to enable:
  security = {
	rtkit.enable = true;
  };
  services = {
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
  };
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
