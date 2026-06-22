----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :( -cringe
    },
})

-- unscale XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

-- toolkit-specific scale
--hl.env("GDK_SCALE", "2")
--hl.env("XCURSOR_SIZE", "32")
