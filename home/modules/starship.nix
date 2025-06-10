{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      # General configuration
      format = "$all";
      right_format = "$battery$time";
      continuation_prompt = "[∙](bright-black) ";
      scan_timeout = 30;
      command_timeout = 500;
      add_newline = true;

      # AWS
      aws = {
        format = "on [\$symbol(\$profile )(\\(\$region\\) )(\\[\$duration\\])](\$style)";
        symbol = "☁️  ";
        style = "bold yellow";
        disabled = false;
        expiration_symbol = "X";
      };

      # Azure
      azure = {
        format = "on [\$symbol(\$subscription)](\$style) ";
        symbol = "ﴃ ";
        style = "blue bold";
        disabled = true;
      };

      # Battery
      battery = {
        full_symbol = " ";
        charging_symbol = " ";
        discharging_symbol = " ";
        unknown_symbol = " ";
        empty_symbol = " ";
        disabled = false;
        format = "[\$symbol\$percentage](\$style) ";
        display = [
          {
            threshold = 10;
            style = "red bold";
          }
        ];
      };

      # Buf
      buf = {
        format = "with [\$symbol (\$version)](\$style)";
        version_format = "v\${raw}";
        symbol = "";
        style = "bold blue";
        disabled = false;
        detect_files = ["buf.yaml" "buf.gen.yaml" "buf.work.yaml"];
      };

      # Character
      character = {
        format = "\$symbol ";
        success_symbol = "[╰─>](bold cyan)";
        error_symbol = "[╰─](bold red)[×](bold red)";
        disabled = false;
      };

      # CMake
      cmake = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "△ ";
        style = "bold blue";
        disabled = false;
        detect_files = ["CMakeLists.txt" "CMakeCache.txt"];
      };

      # COBOL
      cobol = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "⚙️ ";
        style = "bold blue";
        disabled = false;
        detect_extensions = ["cbl" "cob" "CBL" "COB"];
      };

      # Command duration
      cmd_duration = {
        show_milliseconds = true;
        format = "took [\$duration](bold yellow) ";
        disabled = true;
        show_notifications = true;
      };

      # Conda
      conda = {
        truncation_length = 1;
        format = "via [\$symbol\$environment](\$style) ";
        symbol = "🅒 ";
        style = "green bold";
        ignore_base = true;
        disabled = false;
      };

      # Container
      container = {
        format = "[\$symbol \\[\$name\\]](\$style) ";
        symbol = "⬢";
        style = "red bold dimmed";
        disabled = false;
      };

      # Crystal
      crystal = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🔮 ";
        style = "bold red";
        disabled = false;
        detect_extensions = ["cr"];
        detect_files = ["shard.yml"];
      };

      # Dart
      dart = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🎯 ";
        style = "bold blue";
        disabled = false;
        detect_extensions = ["dart"];
        detect_files = ["pubspec.yaml" "pubspec.yml" "pubspec.lock"];
        detect_folders = [".dart_tool"];
      };

      # Deno
      deno = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🦕 ";
        style = "green bold";
        disabled = false;
        detect_files = [
          "deno.json"
          "deno.jsonc"
          "mod.ts"
          "deps.ts"
          "mod.js"
          "deps.js"
        ];
      };

      # Directory
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        fish_style_pwd_dir_length = 0;
        use_logical_path = true;
        format = "[\$path](bold #89dceb)[\$read_only](bold yellow) ";
        repo_root_format = "[\$before_root_path](\$style)[\$repo_root](\$repo_root_style)[\$path](\$style)[\$read_only](\$read_only_style) ";
        style = "bold underline";
        disabled = false;
        read_only = " 🔒";
        read_only_style = "red";
        truncation_symbol = "";
        home_symbol = "~";
        use_os_path_sep = true;
      };

      # Docker context
      docker_context = {
        symbol = "🐳 ";
        style = "blue bold";
        format = "via [\$symbol\$context](\$style) ";
        only_with_files = true;
        disabled = false;
        detect_files = ["docker-compose.yml" "docker-compose.yaml" "Dockerfile"];
      };

      # .NET
      dotnet = {
        format = "via [\$symbol(\$version )(🎯 \$tfm )](\$style)";
        version_format = "v\${raw}";
        symbol = ".NET ";
        style = "blue bold";
        heuristic = true;
        disabled = false;
        detect_extensions = ["csproj" "fsproj" "xproj"];
        detect_files = [
          "global.json"
          "project.json"
          "Directory.Build.props"
          "Directory.Build.targets"
          "Packages.props"
        ];
      };

      # Elixir
      elixir = {
        format = "via [\$symbol(\$version \\(OTP \$otp_version\\) )](\$style)";
        version_format = "v\${raw}";
        symbol = "💧 ";
        style = "bold purple";
        disabled = false;
        detect_files = ["mix.exs"];
      };

      # Elm
      elm = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🌳 ";
        style = "cyan bold";
        disabled = false;
        detect_extensions = ["elm"];
        detect_files = ["elm.json" "elm-package.json" ".elm-version"];
        detect_folders = ["elm-stuff"];
      };

      # Erlang
      erlang = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = " ";
        style = "bold red";
        disabled = false;
        detect_files = ["rebar.config" "erlang.mk"];
      };

      # Fill
      fill = {
        style = "bold black";
        symbol = ".";
        disabled = false;
      };

      # Google Cloud
      gcloud = {
        format = "on [\$symbol\$account(@\$domain)(\\(\$region\\))](\$style) ";
        symbol = "☁️  ";
        style = "bold blue";
        disabled = false;
      };

      # Git branch
      git_branch = {
        format = "on [\$symbol\$branch](\$style)([\$remote](\$style)) ";
        symbol = " ";
        style = "bold purple";
        truncation_length = 9223372036854775807;
        truncation_symbol = "…";
        only_attached = false;
        always_show_remote = false;
        disabled = false;
      };

      # Git commit
      git_commit = {
        commit_hash_length = 7;
        format = "[\\(\$hash\$tag\\)](\$style) ";
        style = "green bold";
        only_detached = true;
        disabled = false;
        tag_symbol = " 🏷  ";
        tag_disabled = true;
      };

      # Git metrics
      git_metrics = {
        added_style = "bold green";
        deleted_style = "bold red";
        only_nonzero_diffs = true;
        format = "([+\$added](\$added_style) )([-\$deleted](\$deleted_style) )";
        disabled = true;
      };

      # Git state
      git_state = {
        rebase = "REBASING";
        merge = "MERGING";
        revert = "REVERTING";
        cherry_pick = "CHERRY-PICKING";
        bisect = "BISECTING";
        am = "AM";
        am_or_rebase = "AM/REBASE";
        style = "bold yellow";
        format = "\\([\$state( \$progress_current/\$progress_total)](\$style)\\) ";
        disabled = false;
      };

      # Git status
      git_status = {
        format = "(\\[[\$all_status\$ahead_behind\\]](\$style) )";
        style = "red bold";
        stashed = "\\$";
        ahead = "⇡";
        behind = "⇣";
        up_to_date = "";
        diverged = "⇕";
        conflicted = "=";
        deleted = "✘";
        renamed = "»";
        modified = "!";
        staged = "+";
        untracked = "?";
        ignore_submodules = false;
        disabled = false;
      };

      # Go
      golang = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🐹 ";
        style = "bold cyan";
        disabled = false;
        detect_extensions = ["go"];
        detect_files = [
          "go.mod"
          "go.sum"
          "glide.yaml"
          "Gopkg.yml"
          "Gopkg.lock"
          ".go-version"
        ];
        detect_folders = ["Godeps"];
      };

      # Haskell
      haskell = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "λ ";
        style = "bold purple";
        disabled = false;
        detect_extensions = ["hs" "cabal" "hs-boot"];
        detect_files = ["stack.yaml" "cabal.project"];
      };

      # Helm
      helm = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "⎈ ";
        style = "bold white";
        disabled = false;
        detect_files = ["helmfile.yaml" "Chart.yaml"];
      };

      # Mercurial branch
      hg_branch = {
        symbol = " ";
        style = "bold purple";
        format = "on [\$symbol\$branch](\$style) ";
        truncation_length = 9223372036854775807;
        truncation_symbol = "…";
        disabled = true;
      };

      # Hostname
      hostname = {
        ssh_only = false;
        trim_at = ".";
        format = "[\$hostname](#94e2d5) in ";
        style = "bold";
        disabled = false;
      };

      # Java
      java = {
        disabled = false;
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        style = "red dimmed";
        symbol = "☕ ";
        detect_extensions = ["java" "class" "jar" "gradle" "clj" "cljc"];
        detect_files = [
          "pom.xml"
          "build.gradle.kts"
          "build.sbt"
          ".java-version"
          "deps.edn"
          "project.clj"
          "build.boot"
        ];
      };

      # Jobs
      jobs = {
        threshold = 1;
        symbol_threshold = 1;
        number_threshold = 2;
        format = "[\$symbol\$number](\$style) ";
        symbol = "✦";
        style = "bold blue";
        disabled = true;
      };

      # Julia
      julia = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "ஃ ";
        style = "bold purple";
        disabled = false;
        detect_extensions = ["jl"];
        detect_files = ["Project.toml" "Manifest.toml"];
      };

      # Kotlin
      kotlin = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🅺 ";
        style = "bold blue";
        kotlin_binary = "kotlin";
        disabled = false;
        detect_extensions = ["kt" "kts"];
      };

      # Kubernetes
      kubernetes = {
        symbol = "☸ ";
        format = "[\$symbol\$context( \\(\$namespace\\))](\$style) in ";
        style = "cyan bold";
        disabled = true;
      };

      # Line break
      line_break = {
        disabled = false;
      };

      # Local IP
      localip = {
        ssh_only = true;
        format = "[\$localipv4](\$style) ";
        style = "yellow bold";
        disabled = true;
      };

      # Lua
      lua = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🌙 ";
        style = "bold blue";
        lua_binary = "lua";
        disabled = false;
        detect_extensions = ["lua"];
        detect_files = [".lua-version"];
        detect_folders = ["lua"];
      };

      # Memory usage
      memory_usage = {
        threshold = 75;
        format = "via \$symbol[\$ram( | \$swap)](\$style) ";
        style = "white bold dimmed";
        symbol = "🐏 ";
        disabled = true;
      };

      # Nim
      nim = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "👑 ";
        style = "yellow bold";
        disabled = false;
        detect_extensions = ["nim" "nims" "nimble"];
        detect_files = ["nim.cfg"];
      };

      # Nix shell
      nix_shell = {
        format = "via [\$symbol\$state( \\(\$name\\))](\$style) ";
        symbol = "❄️  ";
        style = "bold blue";
        impure_msg = "impure";
        pure_msg = "pure";
        disabled = false;
      };

      # Node.js
      nodejs = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = " ";
        style = "bold green";
        disabled = false;
        not_capable_style = "bold red";
        detect_extensions = ["js" "mjs" "cjs" "ts" "mts" "cts"];
        detect_files = ["package.json" ".node-version" ".nvmrc"];
        detect_folders = ["node_modules"];
      };

      # OCaml
      ocaml = {
        format = "via [\$symbol(\$version )(\\(\$switch_indicator\$switch_name\\) )](\$style)";
        version_format = "v\${raw}";
        global_switch_indicator = "";
        local_switch_indicator = "*";
        symbol = "🐫 ";
        style = "bold yellow";
        disabled = false;
        detect_extensions = ["opam" "ml" "mli" "re" "rei"];
        detect_files = ["dune" "dune-project" "jbuild" "jbuild-ignore" ".merlin"];
        detect_folders = ["_opam" "esy.lock"];
      };

      # OpenStack
      openstack = {
        format = "on [\$symbol\$cloud(\\(\$project\\))](\$style) ";
        symbol = "☁️  ";
        style = "bold yellow";
        disabled = false;
      };

      # Package
      package = {
        format = "is [\$symbol\$version](\$style) ";
        symbol = "📦 ";
        style = "208 bold";
        display_private = false;
        disabled = false;
        version_format = "v\${raw}";
      };

      # Perl
      perl = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🐪 ";
        style = "149 bold";
        disabled = false;
        detect_extensions = ["pl" "pm" "pod"];
        detect_files = [
          "Makefile.PL"
          "Build.PL"
          "cpanfile"
          "cpanfile.snapshot"
          "META.json"
          "META.yml"
          ".perl-version"
        ];
      };

      # PHP
      php = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🐘 ";
        style = "147 bold";
        disabled = false;
        detect_extensions = ["php"];
        detect_files = ["composer.json" ".php-version"];
      };

      # Pulumi
      pulumi = {
        format = "via [\$symbol(\$username@)\$stack](\$style) ";
        version_format = "v\${raw}";
        symbol = " ";
        style = "bold 5";
        disabled = false;
      };

      # PureScript
      purescript = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "<=> ";
        style = "bold white";
        disabled = false;
        detect_extensions = ["purs"];
        detect_files = ["spago.dhall"];
      };

      # Python
      python = {
        pyenv_version_name = false;
        pyenv_prefix = "pyenv ";
        python_binary = ["python" "python3" "python2"];
        format = "via [\${symbol}\${pyenv_prefix}(\${version} )(\\(\$virtualenv\\) )](\$style)";
        version_format = "v\${raw}";
        style = "yellow bold";
        symbol = "🐍 ";
        disabled = false;
        detect_extensions = ["py"];
        detect_files = [
          "requirements.txt"
          ".python-version"
          "pyproject.toml"
          "Pipfile"
          "tox.ini"
          "setup.py"
          "__init__.py"
        ];
      };

      # Red
      red = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🔺 ";
        style = "red bold";
        disabled = false;
        detect_extensions = ["red" "reds"];
      };

      # R
      rlang = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        style = "blue bold";
        symbol = "📐 ";
        disabled = false;
        detect_extensions = ["R" "Rd" "Rmd" "Rproj" "Rsx"];
        detect_files = [".Rprofile"];
        detect_folders = [".Rproj.user"];
      };

      # Ruby
      ruby = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "💎 ";
        style = "bold red";
        disabled = false;
        detect_extensions = ["rb"];
        detect_files = ["Gemfile" ".ruby-version"];
        detect_variables = ["RUBY_VERSION" "RBENV_VERSION"];
      };

      # Rust
      rust = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🦀 ";
        style = "bold red";
        disabled = false;
        detect_extensions = ["rs"];
        detect_files = ["Cargo.toml"];
      };

      # Scala
      scala = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        disabled = false;
        style = "red bold";
        symbol = "🆂 ";
        detect_extensions = ["sbt" "scala"];
        detect_files = [".scalaenv" ".sbtenv" "build.sbt"];
        detect_folders = [".metals"];
      };

      # Shell
      shell = {
        format = "[\$indicator](\$style) ";
        bash_indicator = "bsh";
        fish_indicator = "fsh";
        zsh_indicator = "zsh";
        powershell_indicator = "psh";
        ion_indicator = "ion";
        elvish_indicator = "esh";
        tcsh_indicator = "tsh";
        nu_indicator = "nu";
        xonsh_indicator = "xsh";
        cmd_indicator = "cmd";
        unknown_indicator = "";
        style = "white bold";
        disabled = true;
      };

      # Shell level
      shlvl = {
        threshold = 2;
        format = "[\$symbol\$shlvl](\$style) ";
        symbol = "↕️  ";
        repeat = false;
        style = "bold yellow";
        disabled = true;
      };

      # Singularity
      singularity = {
        symbol = "";
        format = "[\$symbol\\[\$env\\]](\$style) ";
        style = "blue bold dimmed";
        disabled = false;
      };

      # Status
      status = {
        format = "[\$symbol\$status](\$style) ";
        symbol = "✖";
        success_symbol = "";
        not_executable_symbol = "🚫";
        not_found_symbol = "🔍";
        sigint_symbol = "🧱";
        signal_symbol = "⚡";
        style = "bold red";
        map_symbol = false;
        recognize_signal_code = true;
        pipestatus = false;
        pipestatus_separator = "|";
        pipestatus_format = "\\[\$pipestatus\\] => [\$symbol\$common_meaning\$signal_name\$maybe_int](\$style)";
        disabled = true;
      };

      # Sudo
      sudo = {
        format = "[as \$symbol](\$style)";
        symbol = "🧙 ";
        style = "bold blue";
        allow_windows = false;
        disabled = true;
      };

      # Swift
      swift = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "🐦 ";
        style = "bold 202";
        disabled = false;
        detect_extensions = ["swift"];
        detect_files = ["Package.swift"];
      };

      # Terraform
      terraform = {
        format = "via [\$symbol\$workspace](\$style) ";
        version_format = "v\${raw}";
        symbol = "💠 ";
        style = "bold 105";
        disabled = false;
        detect_extensions = ["tf" "tfplan" "tfstate"];
        detect_folders = [".terraform"];
      };

      # Time
      time = {
        format = "at [\$time](\$style) ";
        style = "bold yellow";
        use_12hr = false;
        disabled = true;
        utc_time_offset = "local";
        time_range = "-";
      };

      # Username
      username = {
        format = "[╭─](#b4befe)[\$user](#b4befe)[@](bold)";
        style_root = "bold";
        style_user = "bold";
        show_always = true;
        disabled = false;
      };

      # Vagrant
      vagrant = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "⍱ ";
        style = "cyan bold";
        disabled = false;
        detect_files = ["Vagrantfile"];
      };

      # VCSH
      vcsh = {
        symbol = "";
        style = "bold yellow";
        format = "vcsh [\$symbol\$repo](\$style) ";
        disabled = false;
      };

      # V
      vlang = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "V ";
        style = "blue bold";
        disabled = false;
        detect_extensions = ["v"];
        detect_files = ["v.mod" "vpkg.json" ".vpkg-lock.json"];
      };

      # Zig
      zig = {
        format = "via [\$symbol(\$version )](\$style)";
        version_format = "v\${raw}";
        symbol = "↯ ";
        style = "bold yellow";
        disabled = false;
        detect_extensions = ["zig"];
      };
    };
  };
}
