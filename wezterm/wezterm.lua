local wezterm = require 'wezterm';
local act = wezterm.action

local config = {
  default_prog = {"nu.exe"},
  color_scheme = "Apple System Colors",
  window_decorations = "RESIZE|TITLE",
  font_size = 14.0,
  leader = { key="a", mods="CTRL" },
  use_fancy_tab_bar = false,
  keys = {
    { key = "a", mods = "LEADER|CTRL",  action=act{SendString="\x01"}},
    { key = '"', mods = "LEADER|SHIFT", action=act{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "%", mods = "LEADER|SHIFT", action=act{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "c", mods = "LEADER",       action=act{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER",       action=act{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=act{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=act{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=act{ActivatePaneDirection="Right"}},
    { key = "H", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Right", 5}}},
    { key = "&", mods = "LEADER|SHIFT", action=act{CloseCurrentTab={confirm=true}}},
    { key = "d", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}},
    { key = "x", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}},
    { key = "H", mods = "SHIFT|ALT",    action=act.ActivateTabRelative(-1)},
    { key = "L", mods = "SHIFT|ALT",    action=act.ActivateTabRelative(1)},
    { key = "r", mods = "LEADER",       action=act.ReloadConfiguration },
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i - 1),
  })
end

return config
