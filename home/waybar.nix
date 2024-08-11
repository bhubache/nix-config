{pkgs, ...}: {
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
}
