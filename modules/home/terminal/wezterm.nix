{ ... }:
{
  flake.modules.homeManager.wezterm = {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        local config = wezterm.config_builder()

        -- Font
        config.font = wezterm.font("FiraCode Nerd Font")
        config.font_size = 10.0

        -- Appearance
        config.color_scheme = "Dracula"
        config.window_background_opacity = 0.85
        config.window_decorations = "RESIZE"
        config.hide_tab_bar_if_only_one_tab = true

        -- macOS specific blur
        if wezterm.target_triple:find("darwin") then
          config.macos_window_background_blur = 10
        end

        -- Cursor
        -- config.default_cursor_style = "SteadyBar"

        -- Keys
        config.keys = {}

        -- Platform-specific key bindings
        local mod_single, mod_double
        if wezterm.target_triple:find("darwin") then
          mod_single = "CMD"
          mod_double = "CMD|SHIFT"
        else
          mod_single = "CTRL"
          mod_double = "CTRL|SHIFT"
        end

        table.insert(config.keys, { key = "d", mods = mod_single, action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } })
        table.insert(config.keys, { key = "d", mods = mod_double, action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } })
        table.insert(config.keys, { key = "w", mods = mod_single, action = wezterm.action.CloseCurrentPane { confirm = true } })
        table.insert(config.keys, { key = "f", mods = mod_double, action = wezterm.action.ToggleFullScreen })

        return config
      '';
    };
  };
}
