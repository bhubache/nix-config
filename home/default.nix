{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bhubache";
  home.homeDirectory = "/home/bhubache";

  imports = [
    ./neovim/default.nix
    inputs.xremap-flake.homeManagerModules.default
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  services.xremap = {
    withWlroots = true;
    config = {
      modmap = [
        {
	  name = "Caps lock to Left Control/Escape";
	  KEY_CAPSLOCK = {
	    held = "KEY_LEFTCTRL";
	    alone = "KEY_ESC";
	    alone_timeout_millis = 500;
	  };
	}
      ];
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main.font = "MesloLGS Nerd Font Mono:style=Regular:size=14:pixelsize=15:antialias=true";
      colors = {
        alpha = 1;
      };
    };
  };
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 30;
	font-family = "MesloLGS Nerd Font Mono";
	modules-left = [ "sway/workspaces" ];
	modules-center = [ "clock" ];
	modules-right = [ "pulseaudio" "memory" "cpu" "disk" "battery" ];
        clock = {
	  interval = 1;
          format = "{:%r}";  # TODO: Link for syntax
        };
	pulseaudio = {
	  format = "{volume}% {icon} {format_source}";
	  format-bluetooth = "{volume}% {icon} {format_source}";
    	  format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟  {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "󱠰";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
	};
	memory = {
	  format = "{}% Memory";
	};
	cpu = {
	  format = "{usage}% CPU";
	};
	disk = {
	  interval = 30;
	  format = "{specific_free:0.2f} GB free";
	  unit = "GB";
	};
	battery = {
	  bat = "BAT1";
	  states = {
	    warning = 30;
	    critical = 15;
	  };
	  format = "{capacity}% {icon}";
	  format-charging = "{capacity}% 󰢝";
	  format-plugged = "{capacity}% ";
	  format-alt = "{time} {icon}";
    	  format-icons = [ "" "" "" "" "" ];
	};
      };
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    config = {
      terminal = "foot";
      bars = [{ command = "waybar"; }];
      window.border = 0;
      window.titlebar = false;
      # fonts = {
      #   names = [];
      #   size = 11.0;
      # };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -lah";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      gl = "git log";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = "$username$hostname$directory$fill$git_branch$git_commit$git_state$git_metrics$git_status$python$line_break$shell$character";
      directory = {
        truncation_length = 0;
      };
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.ripgrep
    # pkgs.meslo-lgs-nf
    (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; })
    pkgs.wl-clipboard
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bhubache/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
