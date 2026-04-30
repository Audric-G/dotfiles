local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "FOT-Rodin Pro"

theme.bg_normal     = "#fbf1c7"
theme.bg_focus      = "#ebdbb2"
theme.bg_urgent     = "#9d0006"
theme.bg_minimize   = "#d5c4a1"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(0)
theme.border_color_normal = "#000000"
theme.border_color_active = "#bdae93"
theme.border_color_marked = "#91231c"

theme.wallpaper = "~/images/backgrounds/yorhabg-3840x2160.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(150)

-- base16-gruvbox-light-soft
-- color palatte definition
-- {{{ Colors
theme.scheme = "Gruvbox light, soft"
theme.scheme_id = "gruvbox_light_soft"
theme.scheme_author = "Dawid Kurek (dawikur@gmail.com), morhetz (https =//github.com/morhetz/gruvbox)"
theme.scheme_type = "light"
theme.base00 = "#f2e5bc" --# ----
theme.base01 = "#ebdbb2" --# ---
theme.base02 = "#d5c4a1" --# --
theme.base03 = "#bdae93" --# -
theme.base04 = "#665c54" --# +
theme.base05 = "#504945" --# ++
theme.base06 = "#3c3836" --# +++
theme.base07 = "#282828" --# ++++
theme.base08 = "#9d0006" --# red
theme.base09 = "#af3a03" --# orange
theme.base0A = "#b57614" --# yellow
theme.base0B = "#79740e" --# green
theme.base0C = "#427b58" --# aqua/cyan
theme.base0D = "#076678" --# blue
theme.base0E = "#8f3f71" --# purple
theme.base0F = "#d65d0e" --# brown

theme.leading_fg = theme.base0A

theme.bg_systray = "#d5c59b"
theme.base1A = theme.base0B
theme.awesome_icon_bg = theme.base0B
theme.border_color_active = theme.base0F
theme.bg_underline = theme.base0F
theme.bg_focus = "#d5c59b"
-- }}}

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

return theme
