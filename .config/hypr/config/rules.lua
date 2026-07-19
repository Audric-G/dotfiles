--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
    no_initial_focus = true,
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Float by default
hl.window_rule({
    name = "open-floating",
    match = { class = "thunar" },

    float = true
})

-- Open on workspace 6
hl.window_rule({
    name = "open-on-6",
    match = { class = "discord" },

    workspace = 6,
    fullscreen = true,
})

-- Open on workspace 2
hl.window_rule({
    name = "open-on-2",
    match = { class = "steam" },

    workspace = 2,
    fullscreen = true,
})

-- Open on workspace 1
hl.window_rule({
    name = "open-on-1",
    match = { class = "vivaldi-stable" },

    workspace = 1,
    fullscreen = true,
})
