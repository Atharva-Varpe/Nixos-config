{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Shell
      shell = "/etc/profiles/per-user/luna/bin/zsh";

      # Font configuration
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "14.0";

      # Cursor
      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";
      cursor_underline_thickness = "2.0";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";

      # Scrollback
      scrollback_lines = 2000;
      scrollback_pager = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";

      # Mouse
      mouse_hide_wait = "3.0";
      url_style = "curly";

      # Performance tuning
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      # Bell
      enable_audio_bell = false;
      visual_bell_duration = "0.0";
      window_alert_on_bell = true;
      bell_on_tab = true;

      # Window layout
      remember_window_size = true;
      initial_window_width = "120c";
      initial_window_height = "35c";
      enabled_layouts = "tall";
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      window_border_width = "1px";
      draw_minimal_borders = true;
      window_margin_width = 0;
      single_window_margin_width = -1;
      window_padding_width = 4;
      placement_strategy = "center";
      active_border_color = "#F5E0DC";
      inactive_border_color = "#6C7086";
      hide_window_decorations = true;

      # Transparency
      background_opacity = "0.7";

      # Tab bar
      tab_bar_edge = "bottom";
      tab_bar_margin_width = "0.0";
      tab_bar_margin_height = "0.0 0.0";
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 1;
      tab_bar_align = "left";
      tab_switch_strategy = "previous";
      tab_fade = "0.25 0.5 0.75 1";
      tab_separator = " ┇";
      tab_title_template = "{index}: {title}";
      tab_bar_background = "#11111B";

      # Color scheme (Catppuccin Mocha)
      foreground = "#CDD6F4";
      background = "#1E1E2E";
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      # Cursor colors
      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";

      # URL underline color when hovering with mouse
      url_color = "#F5E0DC";

      # Tab bar colors
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      active_tab_font_style = "bold";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      inactive_tab_font_style = "normal";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#1e1e2e";
      mark1_background = "#b4befe";
      mark2_foreground = "#1e1e2e";
      mark2_background = "#a6e3a1";
      mark3_foreground = "#1e1e2e";
      mark3_background = "#f9e2af";

      # The 16 terminal colors (Catppuccin Mocha)

      # black
      color0 = "#1E1E2E";
      color8 = "#45475A";

      # red
      color1 = "#F38BA8";
      color9 = "#F38BA8";

      # green
      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      # yellow
      color3 = "#F9E2AF";
      color11 = "#F9E2AF";

      # blue
      color4 = "#89B4FA";
      color12 = "#89B4FA";

      # magenta
      color5 = "#F5C2E7";
      color13 = "#F5C2E7";

      # cyan
      color6 = "#94E2D5";
      color14 = "#94E2D5";

      # white
      color7 = "#BAC2DE";
      color15 = "#A6ADC8";
    };

    keybindings = {
      # Tab management (updated from kitty.conf)
      "cmd+shift+t" = "new_tab";
      "cmd+shift+]" = "next_tab";
      "cmd+shift+[" = "previous_tab";
      "cmd+shift+q" = "close_tab";

      # Window management (updated from kitty.conf)
      "cmd+shift+enter" = "new_window";
      "cmd+shift+w" = "close_window";

      # Clipboard (updated from kitty.conf)
      "cmd+c" = "copy_to_clipboard";
      "cmd+v" = "paste_from_clipboard";

      # Scrolling (updated from kitty.conf)
      "cmd+shift+up" = "scroll_line_up";
      "cmd+shift+down" = "scroll_line_down";
      "cmd+shift+home" = "scroll_home";
      "cmd+shift+end" = "scroll_end";

      # Font sizes (updated from kitty.conf)
      "cmd+plus" = "change_font_size all +2.0";
      "cmd+minus" = "change_font_size all -2.0";
      "cmd+equal" = "change_font_size all 0";

      # Additional keybindings for Linux/Ctrl variants
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+." = "move_tab_forward";
      "ctrl+shift+," = "move_tab_backward";
      "ctrl+shift+alt+t" = "set_tab_title";

      # Window management (Linux/Ctrl variants)
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+n" = "new_os_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";
      "ctrl+shift+f" = "move_window_forward";
      "ctrl+shift+b" = "move_window_backward";
      "ctrl+shift+`" = "move_window_to_top";
      "ctrl+shift+r" = "start_resizing_window";

      # Layout management
      "ctrl+shift+l" = "next_layout";

      # Selection (Linux/Ctrl variants)
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+o" = "pass_selection_to_program";

      # Scrolling (Linux/Ctrl variants)
      "ctrl+shift+up" = "scroll_line_up";
      "ctrl+shift+k" = "scroll_line_up";
      "ctrl+shift+down" = "scroll_line_down";
      "ctrl+shift+j" = "scroll_line_down";
      "ctrl+shift+page_up" = "scroll_page_up";
      "ctrl+shift+page_down" = "scroll_page_down";
      "ctrl+shift+home" = "scroll_home";
      "ctrl+shift+end" = "scroll_end";
      "ctrl+shift+h" = "show_scrollback";

      # Font sizes (Linux/Ctrl variants)
      "ctrl+shift+equal" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
      "ctrl+shift+backspace" = "change_font_size all 0";

      # Miscellaneous
      "ctrl+shift+f11" = "toggle_fullscreen";
      "ctrl+shift+f10" = "toggle_maximized";
      "ctrl+shift+u" = "kitten unicode_input";
      "ctrl+shift+f2" = "edit_config_file";
      "ctrl+shift+escape" = "kitty_shell window";
      "ctrl+shift+a>m" = "set_background_opacity +0.1";
      "ctrl+shift+a>l" = "set_background_opacity -0.1";
      "ctrl+shift+a>1" = "set_background_opacity 1";
      "ctrl+shift+a>d" = "set_background_opacity default";
    };
  };
}
