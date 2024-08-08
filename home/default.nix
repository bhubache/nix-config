{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bhubache";
  home.homeDirectory = "/home/bhubache";

  imports = [
    ./neovim/default.nix
  ];

  programs.foot = {
    enable = true;
    settings = {
      main.font = "MesloLGS Nerd Font Mono:style=Regular:size=14:pixelsize=15:antialias=true";
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
	modules-center = [ "clock" ];
	modules-right = [ "memory" "cpu" "disk" ];
        clock = {
	  interval = 1;
          format = "{:%A, %B %d | %r}";  # TODO: Link for syntax
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

  programs.bash = {
    enable = true;
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
