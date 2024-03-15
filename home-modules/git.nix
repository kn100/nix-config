{...}: {
  programs.git = {
    # TODO: Investigate git + flakes + home manager nonsense
    enable = true;
    userName = "kn100";
    userEmail = "kn100@kn100.me";
    extraConfig = {
      color.ui = true;
      github.user = "kn100";
      init.defaultBranch = "main";
      # Always use SSH instead of HTTPS
      "url \"ssh://git@github.com/\"".insteadOf = "https://github.com/";
    };
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      cm = "commit";
      df = "diff";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };
  };
}
