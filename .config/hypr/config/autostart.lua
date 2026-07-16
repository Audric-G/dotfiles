-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)
--

local notificationd = "swaync"
local polkitAuth    = "systemctl --user start hyprpolkitagent"
local desktopShell  = "qs -c noctalia-shell"
local wallpaper     = "hyprpaper"
local clipManText   = "wl-paste --type text --watch cliphist store"
local clipManImage  = "wl-paste --type image --watch cliphist store"
local steam         = "steam -silent %U" -- start steam without opening client, faster first launch

hl.on("hyprland.start", function ()
    hl.exec_cmd(notificationd)
    hl.exec_cmd(polkitAuth)
    hl.exec_cmd(desktopShell)
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(clipManText)
    hl.exec_cmd(clipManImage)
    hl.exec_cmd(steam)
end)
