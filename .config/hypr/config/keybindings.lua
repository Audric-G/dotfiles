local programs = require ("config.programs")

---------------------
---- KEYBINDINGS ----
---------------------

-- local mainMod = "SUPER"  -- Sets "Windows" key as main modifier
local mainMod = "SUPER"      -- Sets "L-Alt" key as main modifier
local secMod  = "MOD1"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(programs["terminal"]))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs["fileManager"]))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
--hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(programs["menu"]))
--hl.bind(mainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Show cliphist history with rofi
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- Move focus with mainMod + arrow keys
-- Vim movement
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(secMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(secMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
--hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
--hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(secMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(secMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
--hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
--hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
--hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
--hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
--hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
--hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
--hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
--hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
--hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
--hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

---------------------
----  Noctalia  ----
---------------------

-- Want to see all controls?
-- qs -c noctalia-shell ipc show 
local ipc = "qs -c noctalia-shell ipc call"

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"))

---------------------
----   Custom   -----
---------------------

-- Dispatchers documentation
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/

-- Screenshot bindings
-- Freeze screen region select on just PRINT press only to clipboard
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -zm region --clipboard-only"))

-- Freeze screen window select on SHIFT + PRINT press only to clipboard
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -zm window --clipboard-only"))

-- Freeze screen region select on mainMod + PRINT 
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -zm region"))

-- Freeze screen window select on mainMod + SHIFT + PRINT 
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -zm window"))

-- AwesomeWM like fullscreen and monocle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Jumps mouse to other monitor
-- +1/-2 are relative monitor positions, essentially just a toggle in a 2 monitor setup
hl.bind(mainMod .. " + period", hl.dsp.focus({ monitor = "+1" }))

-- Move active window to other monitor
hl.bind(mainMod .. " + O", hl.dsp.window.move({ monitor = "+1" }))
