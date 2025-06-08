{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    
    settings = {
      # General configuration
      format = "$all$character";
      right_format = "$cmd_duration$time";
      
      # Character configuration
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
        vicmd_symbol = "[V](bold green)";
      };
      
      # Directory configuration
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        style = "bold cyan";
        read_only = " 󰌾";
        read_only_style = "red";
        truncate_to_repo = true;
      };
      
      # Git configuration
      git_branch = {
        symbol = " ";
        style = "bold purple";
        truncation_length = 20;
        truncation_symbol = "…";
      };
      
      git_status = {
        style = "bold yellow";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        deleted = "x";
        modified = "!";
        staged = "+";
        stashed = "$";
        untracked = "?";
        conflicted = "=";
        renamed = "r";
      };
      
      # Programming languages
      nodejs = {
        symbol = " ";
        style = "bold green";
      };
      
      python = {
        symbol = " ";
        style = "bold yellow";
      };
      
      rust = {
        symbol = " ";
        style = "bold red";
      };
      
      java = {
        symbol = " ";
        style = "bold orange";
      };
      
      golang = {
        symbol = " ";
        style = "bold cyan";
      };
      
      # Package managers
      package = {
        symbol = "📦 ";
        style = "bold red";
      };
      
      # Docker
      docker_context = {
        symbol = " ";
        style = "bold blue";
      };
      
      # Kubernetes
      kubernetes = {
        symbol = "☸ ";
        style = "bold blue";
        disabled = false;
      };
      
      # Memory usage
      memory_usage = {
        disabled = false;
        threshold = 70;
        symbol = "🐏 ";
        style = "bold dimmed white";
      };
      
      # Time
      time = {
        disabled = false;
        format = "🕙 $time";
        time_format = "%T";
        style = "bold white";
      };
      
      # Command duration
      cmd_duration = {
        min_time = 2000;
        format = "⏱ $duration";
        style = "bold yellow";
      };
      
      # Battery
      battery = {
        full_symbol = "🔋";
        charging_symbol = "🔌";
        discharging_symbol = "⚡";
        
        display = [
          {
            threshold = 10;
            style = "bold red";
          }
          {
            threshold = 30;
            style = "bold yellow";
          }
        ];
      };
      
      # Username
      username = {
        style_user = "bold blue";
        style_root = "bold red";
        show_always = false;
      };
      
      # Hostname
      hostname = {
        ssh_only = false;
        style = "bold green";
        disabled = true;
      };
      
      # Shell indicator
      shell = {
        fish_indicator = "🐠";
        zsh_indicator = "🐚";
        bash_indicator = "🐧";
        disabled = true;
      };
      
      # OS
      os = {
        disabled = true;
        symbols = {
          NixOS = " ";
          Ubuntu = " ";
          Arch = " ";
          Fedora = " ";
        };
      };
    };
  };
}
