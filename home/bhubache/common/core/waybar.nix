{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
	border-radius: 0;
	font-family: "JetBrains Mono";
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 30;
	font-family = "MesloLGS Nerd Font Mono";
	modules-left = [ "sway/workspaces" ];
	modules-center = [ "clock" ];
	modules-right = [ "pulseaudio" "memory" "cpu" "disk" "battery" ];
	spacing = 10;
	"sway/workspaces" = {
	  persistent-workspaces = {
	    "1" = ["eDP-1"];
	    "2" = ["eDP-2"];
	    "3" = ["eDP-3"];
	  };
	};
        clock = {
	  interval = 1;
          format = "{:%R %p}";

	  # NOTE: https://github.com/Alexays/Waybar/issues/3024
	  timezone = "America/North_Dakota/Center";
        };
	pulseaudio = {
	  format = "VOL {volume}%    MIC {format_source}";
	  format-bluetooth = "{volume}% {icon} {format_source}";
    	  format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟  {format_source}";
          format-source = "{volume}%";
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
	  format = "RAM {}%";
	};
	cpu = {
	  format = "CPU {usage}%";
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
}
