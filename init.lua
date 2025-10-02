local worldpath = core.get_worldpath()
config_folder = worldpath .. "/simply_mods"


simply_lib = {}

function simply_lib.saveConfig(modname, tbl)
	local modC = config_folder .. "/" .. modname .. ".txt"
	local f = io.open(modC, "w")
	f:write(minetest.serialize(tbl))
	f:close()
	print("[Simply Lib] Saved config for mod '" ..  modname .. "'.")
end

function simply_lib.loadConfig(modname)
	local modC = config_folder .. "/" .. modname .. ".txt"
	local f = io.open(modC, "r")
	if not f then
		-- file does not exist
		return {}
	end
	local data = f:read("*a")
	f:close()
	local modConfig = minetest.deserialize(data) or {}
	return modConfig
end


print("[Simply Lib] Initialized simply_mods by greatbigdiamond.")
