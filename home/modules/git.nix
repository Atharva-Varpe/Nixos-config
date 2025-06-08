{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Atharva"; # Change this to your name
    userEmail = "atharva.varpe2019@example.com"; # Change this to your email
    
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "code --wait";
      pull.rebase = false;
      push.autoSetupRemote = true;
      
      # Better diff and merge tools
      diff.tool = "vscode";
      merge.tool = "vscode";
      difftool.vscode.cmd = "code --wait --diff $LOCAL $REMOTE";
      mergetool.vscode.cmd = "code --wait $MERGED";
      
      # Color output
      color.ui = true;
      color.branch = "auto";
      color.diff = "auto";
      color.status = "auto";
      
      # Aliases
      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --graph --decorate --all";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "!gitk";
      };
    };
    
    # Delta for better diffs
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };
  };
  
  # GitHub CLI
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "code --wait";
    };
  };
}
