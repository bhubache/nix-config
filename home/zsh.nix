{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza --long --color=always --icons=always --all --all --group --git";
      cat = "bat";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      gl = "git log";
    };
  };
}
