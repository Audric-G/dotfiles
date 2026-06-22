------------------
---- MONITORS ----
------------------

-- To show all monitors do
-- hyprctl monitors all

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",          -- Display Port 1
    mode     = "3840x2160@144", -- resolution@framerate
    position = "1080x480",      -- DP-2 positioned right of DP-1 a quarter down (1920 / 4) 
    scale    = "1.5",             -- Might set to 2 (did set to 2)
})

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@144",
    position = "0x0",
    transform = 1,
    scale    = "1",
})
