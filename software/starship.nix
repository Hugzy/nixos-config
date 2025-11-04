{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = "$all$character";
      add_newline = false;
      
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vimcmd_symbol = "[❮](bold green)";
      };

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        style = "bold cyan";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        deleted = "x";
      };

      nodejs = {
        symbol = " ";
        style = "bold green";
      };

      rust = {
        symbol = " ";
        style = "bold red";
      };

      golang = {
        symbol = " ";
        style = "bold cyan";
      };

      python = {
        symbol = " ";
        style = "bold yellow";
      };

      docker_context = {
        symbol = " ";
        style = "bold blue";
      };

      kubernetes = {
        disabled = false;
        symbol = "☸ ";
        style = "bold blue";
      };

      time = {
        disabled = false;
        format = "[$time]($style) ";
        style = "bold yellow";
        time_format = "%H:%M";
      };

      cmd_duration = {
        min_time = 2000;
        format = "took [$duration](bold yellow)";
      };
    };
  };
}
