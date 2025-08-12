-- My Palette

Black = "#1e1e2e"
Red = "#f38ba8"
Green = "#a6e3a1"
Yellow = "#f9e2af"
Blue = "#89b4fa"
Magenta = "#cba6f7"
Cyan = "#74c7ec"
White = "#b4befe"
Black_b = "#6c7086"
Red_b = "#fab382"
Green_b = "#94e2d5"
Yellow_b = "#f2cdcd"
Blue_b = "#89dceb"
Magenta_b = "#f5c2e7"
Cyan_b = "#94e3d5"
White_b = "#e4e4e4"

Main = White
Foreground = "#cdd6f4"
Background = "rgba(9% 9% 15% 50%)"
Transparent = "rgba(0%, 0%, 0%, 0%)"

local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  if tab.is_active then
    background = Main
    foreground = Black
    edge_background = Transparent
  elseif hover then
    background = Green
    foreground = Black
    edge_background = Transparent
  else
    background = Black
    foreground = Main
    edge_background = Transparent
  end

  local title = tab_title(tab)

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  title = wezterm.truncate_right(title, max_width - 2)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = background } },
    { Text = "" },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = background } },
    { Text = "" },
  }
end)

-- config
config = {

  -- to fix a nighty bug
  initial_cols = 134,
  initial_rows = 39,

  -- sets font
  font = wezterm.font_with_fallback({
    "ComicShannsMonoNerdFontMono",
    "jepfont",
  }),

  font_size = 14,

  -- misc
  hide_mouse_cursor_when_typing = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,

  -- colors
  colors = {
    foreground = Foreground,
    background = Background,

    cursor_bg = Main,
    cursor_fg = Background,
    -- Bar or Underline.
    cursor_border = Main,
    selection_fg = Background,
    selection_bg = Main,

    -- The color of the split lines between panes
    split = Black_b,

    tab_bar = {

      background = Transparent,

      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = Transparent,
        fg_color = Main,
      },
      new_tab_hover = {
        bg_color = Transparent,
        fg_color = Green,
      },
    },

    ansi = {
      Black,
      Red,
      Green,
      Yellow,
      Blue,
      Magenta,
      Cyan,
      White,
    },

    brights = {
      Black_b,
      Red_b,
      Green_b,
      Yellow_b,
      Blue_b,
      Magenta_b,
      Cyan_b,
      White_b,
    },
  },

  keys = {
    {
      key = "t",
      mods = "CTRL",
      action = act.SpawnTab("CurrentPaneDomain"),
    },
    -- Create a new tab in the default domain
    {
      key = "w",
      mods = "SHIFT|CTRL",
      action = wezterm.action.CloseCurrentTab({ confirm = true }),
    },
    { key = "h", mods = "CTRL", action = act.ActivateTabRelative(-1) },
    { key = "l", mods = "CTRL", action = act.ActivateTabRelative(1) },
    -- This will create a new split and run your default program inside it
    {
      key = "s",
      mods = "SHIFT|CTRL",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "UpArrow",
      mods = "SHIFT|CTRL",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "DownArrow",
      mods = "SHIFT|CTRL",
      action = act.ActivatePaneDirection("Down"),
    },
    {
      key = "k",
      mods = "SHIFT|CTRL",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "SHIFT|CTRL",
      action = act.ActivatePaneDirection("Down"),
    },
    {
      key = "q",
      mods = "SHIFT|CTRL",
      action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },
    {
      key = "Enter",
      mods = "SHIFT|CTRL",
      action = act.ActivateCopyMode,
    },
  },

  key_tables = {
    copy_mode = {
      { key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
      { key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
      { key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
      { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
      { key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
      { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
      { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
      { key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
      { key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
      { key = "F", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
      { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
      { key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
      { key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
      { key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
      { key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
      { key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
      { key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
      { key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
      { key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
      { key = "T", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
      { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
      { key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
      { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
      { key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
      { key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
      { key = "k", mods = "SHIFT", action = act.CopyMode("PageUp") },
      { key = "c", mods = "CTRL", action = act.CopyMode("Close") },
      { key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
      { key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
      { key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
      { key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
      { key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
      { key = "j", mods = "SHIFT", action = act.CopyMode("PageDown") },
      { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
      { key = "g", mods = "CTRL", action = act.CopyMode("Close") },
      { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
      { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
      { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
      { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
      { key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
      { key = "q", mods = "NONE", action = act.CopyMode("Close") },
      { key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
      { key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
      { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
      { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
      { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
      {
        key = "y",
        mods = "NONE",
        action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
      },
      { key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
      { key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
      { key = "End", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "Home", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
      { key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
      { key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
      { key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
      { key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
      { key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
      { key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
    },
  },
}

return config
