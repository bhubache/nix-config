{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = "$username$hostname$directory$fill $git_branch$git_commit$git_state$git_metrics$git_status$python$line_break$shell$character";
      directory = {
        truncation_length = 0;
	read_only = " ";
	read_only_style = "bold";
      };
      fill = {
        symbol = "―";
	style = "bold green";
      };
      python = {
        format = "$symbol ";
	symbol = " ";
      };
    };
  };
}
