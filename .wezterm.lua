-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- https://github.com/yutkat/dotfiles/blob/main/.config/wezterm/wezterm.lua

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.enable_tab_bar = false
-- config.enable_tab_bar = true
config.color_scheme = 'AdventureTime' -- nordfox
config.font_size = 19.0
-- config.full_screen = true
config.warn_about_missing_glyphs = false
config.keys = {
  {
    key = 'e',
    mods = 'CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}
-- config.disable_default_key_bindings = true


local mux = wezterm.mux

-- https://github.com/wez/wezterm/issues/284 Does not work great
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}

-- and finally, return the configuration to wezterm
return config
