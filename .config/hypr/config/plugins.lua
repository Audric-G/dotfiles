-----------------------
----    PLUGINS    ----
-----------------------

-- Handles plugin loading
-- idfk what this does but it's in the split monitors workspaces installation guide
package.path = package.path .. ";./?.lua;./?/init.lua"

local smw = require("plugins.split-monitor-workspaces")

smw.setup({
    workspace_count = 5, -- This will create 5 persistent workspaces on each monitor at startup
    monitor_priority = { "DP-1", "DP-2" },
})

-- Some keybinds setup here, would rather keep everything in keybinds.lua
-- but don't feel like making a different solution at the moment

--- `get_amount_of_workspaces` is an easy helper function that simply returns the workspace_count you passed to the setup function.
local mainMod = "MOD1"
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    -- Switch to the Nth workspace on the currently focused monitor.
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor silently (no focus change).
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace_silent(n))
end

--- Cycle workspaces on the current monitor.
--- Accepts "next", "prev", "+N", or "-N" (e.g. "+2" skips two workspaces at once. why would you want to do that? idk but you can).
hl.bind(mainMod .. " + mouse_down", smw.cycle_workspaces("next"))
hl.bind(mainMod .. " + mouse_up", smw.cycle_workspaces("prev"))

--- Relative workspace switching using workspace().
--- "+N" / "-N" jump N workspaces forward/backward from the currently active one.
--- Wrapping behaviour follows the enable_wrapping config option.
hl.bind(mainMod .. " + PAGE_UP", smw.workspace("+1"))   -- Next workspace (relative).
hl.bind(mainMod .. " + PAGE_DOWN", smw.workspace("-1")) -- Previous workspace (relative).

--- "empty" workspace: switch to the first empty workspace on the current monitor.
--- It can also be used as an argument with move_to_workspace(_silent) to move windows to the first empty workspace on the monitor.
--- Falls back to the last workspace in the monitor's range if all are occupied.
hl.bind(mainMod .. " + E", smw.workspace("empty"))
hl.bind(mainMod .. " + SHIFT + E", smw.move_to_workspace("empty"))

--- Move orphaned windows (not assigned to any mapped workspace) to the current workspace.
hl.bind(mainMod .. " + SHIFT + G", smw.grab_rogue_windows())
