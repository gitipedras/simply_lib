local config_folder = minetest.get_worldpath() .. "/simply_mods"
simply_lib = {}

if config_folder~=nil then
	print("[Simply Lib] Config folder does not exist: creating...")
	core.mkdir(config_folder)
end

local modpath = minetest.get_modpath("simply_lib")

dofile(modpath .. "/titles.lua")

local debug_enabled = true

function sDebug(message)
	if debug_enabled == true then
		print("[Simply Lib] " .. message)
	else
		-- debug disabled
	end
end

sDebug("Configuration folder is: " .. config_folder)


function simply_lib.saveConfig(modname, tbl)
	local modC = config_folder .. "/" .. modname .. ".txt"
	local f = io.open(modC, "w")
	f:write(minetest.serialize(tbl))
	f:close()
	sDebug("Saved config for mod '" ..  modname .. "'.")
end

function simply_lib.loadConfig(modname)
	local modC = config_folder .. "/" .. modname .. ".txt"
	local f = io.open(modC, "r")
	if not f then return {} end
	local data = f:read("*a")
	f:close()
	local modConfig = minetest.deserialize(data) or {}
	sDebug("Config for '" .. modname .. "' data dump: " .. dump(modConfig))
	return modConfig
end


print("[Simply Lib] Initialized simply_mods by greatbigdiamond.")
