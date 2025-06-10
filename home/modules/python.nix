{ config, pkgs, ... }:

{
  # Python development environment configuration

  # Add Python-related environment variables and shell configuration
  home.sessionVariables = {
    # Pyenv configuration
    PYENV_ROOT = "$HOME/.pyenv";
    PATH = "$PYENV_ROOT/bin:$PATH";

    # Jupyter configuration
    JUPYTER_CONFIG_DIR = "$HOME/.jupyter";
    JUPYTER_DATA_DIR = "$HOME/.local/share/jupyter";
  };

  # Shell initialization for pyenv
  programs.zsh.initExtra = ''
    # Initialize pyenv if available
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init --path)"
      eval "$(pyenv init -)"
    fi

    # Jupyter aliases for convenience
    alias jlab="jupyter lab"
    alias jnb="jupyter notebook"
    alias jkernels="jupyter kernelspec list"
  '';

  # Git configuration for Jupyter notebooks
  programs.git.extraConfig = {
    # Better handling of Jupyter notebooks in git
    filter.nbstripout = {
      clean = "jupyter nbconvert --stdin --stdout --to notebook --ClearOutputPreprocessor.enabled=True";
      smudge = "cat";
    };
  };

  # Create Jupyter configuration directory
  home.file.".jupyter/jupyter_lab_config.py".text = ''
    # Jupyter Lab configuration
    c = get_config()

    # Security
    c.ServerApp.token = ''
    c.ServerApp.password = ''
    c.ServerApp.open_browser = True
    c.ServerApp.port = 8888

    # Interface
    c.LabApp.default_url = '/lab'

    # Extensions
    c.LabApp.check_for_updates_url = None
  '';

  # Create a simple Jupyter notebook starter
  home.file.".jupyter/notebook_starter.ipynb".text = builtins.toJSON {
    cells = [
      {
        cell_type = "markdown";
        metadata = {};
        source = [
          "# Welcome to Jupyter!\n"
          "\n"
          "This is a starter notebook for your Python development environment.\n"
          "\n"
          "## Available Python packages:\n"
          "- NumPy, Pandas, matplotlib (install with pip)\n"
          "- Jupyter Lab and Notebook\n"
          "- IPython with enhanced features\n"
        ];
      }
      {
        cell_type = "code";
        execution_count = null;
        metadata = {};
        outputs = [];
        source = [
          "# Check Python version and available packages\n"
          "import sys\n"
          "import pkg_resources\n"
          "\n"
          "print(f\"Python version: {sys.version}\")\n"
          "print(f\"Python executable: {sys.executable}\")\n"
          "\n"
          "# List installed packages\n"
          "installed_packages = [d.project_name for d in pkg_resources.working_set]\n"
          "print(f\"\\nInstalled packages: {len(installed_packages)}\")\n"
          "for pkg in sorted(installed_packages)[:10]:\n"
          "    print(f\"  - {pkg}\")\n"
          "if len(installed_packages) > 10:\n"
          "    print(f\"  ... and {len(installed_packages) - 10} more\")"
        ];
      }
    ];
    metadata = {
      kernelspec = {
        display_name = "Python 3";
        language = "python";
        name = "python3";
      };
      language_info = {
        name = "python";
        version = "3.x";
      };
    };
    nbformat = 4;
    nbformat_minor = 4;
  };
}
