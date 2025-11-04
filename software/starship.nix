{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$golang$dotnet$nix_shell$kubernetes$docker_context$character";
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
        format = "[$path]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        deleted = "x";
        modified = "!";
        untracked = "?";
        staged = "+";
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold red";
      };

      golang = {
        symbol = " ";
        style = "bold cyan";
        format = "[$symbol($version)]($style) ";
      };

      dotnet = {
        symbol = " ";
        style = "bold blue";
        format = "[$symbol($version)]($style) ";
      };

      nix_shell = {
        symbol = " ";
        style = "bold blue";
        format = "[$symbol$state]($style) ";
      };

      kubernetes = {
        disabled = false;
        symbol = "☸ ";
        style = "bold blue";
        format = "[$symbol$context( \\($namespace\\))]($style) ";
      };

      docker_context = {
        symbol = " ";
        style = "bold blue";
        format = "[$symbol$context]($style) ";
      };
    };
  };
}
