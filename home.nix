{ config, pkgs, ... }:
{
    home.username = "_reave";
    home.homeDirectory = "/home/_reave";
    home.sessionPath = [ "$HOME/.nix-profile/bin" ]:

    home.stateVersion = "25.05";

    home.packages = [
        	pkgs.pipewire
        	pkgs.meson
        	pkgs.ninja
        	pkgs.dunst
        	pkgs.libnotify
		pkgs.wget
        	pkgs.htop
		pkgs.zoxide
        	pkgs.obsidian           	#Notes
        	pkgs.zsh	        	#FuckBash
        	pkgs.oh-my-zsh	    		#ifykyk
        	pkgs.alacritty		    	#Terminal
		pkgs.vscode			#WorkShenanigans
        	pkgs.firefox			#InternetBrowser
        	pkgs.rofi-wayland 		#AppLauncher
        	pkgs.wl-clipboard		#ClipboardFunctionality
        	pkgs.yazi			#TerminalFileManager
        	pkgs.xfce.tumbler		#FileManagerThumbnails
        	pkgs.ffmpegthumbnailer		#VideoThumbnails
        	pkgs.gvfs			#TrashSupport
        	pkgs.swww			#WallpaperDaemon
        	pkgs.xfce.thunar        	#GUIFileManager	
        #	hyprpanel		        #Statusbar
    ];

    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
            history = {
                size = 10000;
                save = 10000;
                ignoreDups = true;
            };
            oh-my-zsh = {
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
        alacritty = {
            enable = true;	
            settings ={
                font.size = 12;
                shell.program = "/usr/local/bin/zsh";
            };	
        };
        neovim.enable = true;
        firefox.enable = true;
    };
}
