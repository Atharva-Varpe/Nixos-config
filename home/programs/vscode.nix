{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Languages
        ms-python.python
        rust-lang.rust-analyzer
        # TypeScript and JSON support are built into VS Code by default
        redhat.vscode-yaml

        # Git
        eamodio.gitlens

        # Themes
        pkief.material-icon-theme

        # Productivity
        # Extensions will be configured later once available ones are confirmed

        # Nix support
        bbenoist.nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "tokyo-night-dark";
          publisher = "drewxs";
          version = "0.3.3";
          sha256 = "sha256-0T6suUgUpVZj8DQPl5cKiKtiSTPkg0HnPIzUM5qc978=";
        }
      ];

      userSettings = {
      # Editor settings
      "editor.fontSize" = 14;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'JetBrains Mono', 'Cascadia Code', 'Fira Code', Consolas, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "editor.lineNumbers" = "on";
      "editor.minimap.enabled" = true;
      "editor.wordWrap" = "on";
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = true;
      "editor.suggestSelection" = "first";
      "editor.acceptSuggestionOnCommitCharacter" = false;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";

      # Workbench settings
      "workbench.colorTheme" = "Tokyo Night Dark";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "newUntitledFile";
      "workbench.enableExperiments" = false;

      # Terminal settings
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'JetBrains Mono', 'Cascadia Code', monospace";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyle" = "line";

      # File settings
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;

      # Explorer settings
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.compactFolders" = false;

      # Git settings
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "gitlens.hovers.currentLine.over" = "line";

      # Language specific settings
      "python.defaultInterpreterPath" = "/usr/bin/python3";
      "python.formatting.provider" = "black";
      "python.linting.enabled" = true;
      "python.linting.pylintEnabled" = true;

      # Nix settings
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";

      # Other settings
      "security.workspace.trust.untrustedFiles" = "open";
      "telemetry.telemetryLevel" = "off";
      "update.mode" = "none";
      "extensions.autoUpdate" = false;

        # Prettier settings
        "prettier.tabWidth" = 2;
        "prettier.semi" = true;
        "prettier.singleQuote" = true;
        "prettier.trailingComma" = "es5";
      };

      keybindings = [
        {
          "key" = "ctrl+shift+p";
          "command" = "workbench.action.showCommands";
        }
        {
          "key" = "ctrl+`";
          "command" = "workbench.action.terminal.toggleTerminal";
        }
        {
          "key" = "ctrl+shift+`";
          "command" = "workbench.action.terminal.new";
        }
      ];
    };
  };
}
