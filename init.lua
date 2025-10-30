simply_lib = {}

local modpath = minetest.get_modpath("simply_lib")


--==== Simply Lib Features ====--

dofile(modpath .. "/titles.lua")

local debug_enabled = true

function sDebug(message)
	if debug_enabled == true then
		print("[Simply Lib] " .. message)
	else
		-- debug disabled
	end
end

print("[Simply Lib] Initialized simply_mods by greatbigdiamond.")
