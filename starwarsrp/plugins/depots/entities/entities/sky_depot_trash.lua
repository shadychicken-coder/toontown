AddCSLuaFile()

local PLUGIN = PLUGIN

ENT.Base = "sky_depot_base"
ENT.PrintName = "Depot Trash" --name in spawn menu
ENT.Category = "Depots" --category in spawn menu
ENT.Author = "sky"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.RenderGroup = RENDERGROUP_OPAQUE


ENT.name = "Dumpster" --name displayed when looking at it
ENT.desc = "A dumpster filled with various garbage." --desc under it
ENT.model = "models/props_junk/trashdumpster01a.mdl" --model given to it
--ENT.mat = "models/props_pipes/destroyedpipes01a" --optional to overwrite material, wont work with all mats, usually only works with mats in models/, unsure of the actual part of the material that makes it work
ENT.action = "Searching..." --the text shown when using it
ENT.timeUse = 3.5 --how long the use timer is in seconds
ENT.cooldownTime = 80 --the time in seconds between uses
ENT.stock = 12 --the amount of uses it has with no scaling
ENT.lowstock = 6 --when the uses get this amount, it adds onto the desc "It looks like this is starting to get empty."
ENT.vlowstock = 3 --when it gets to this amount, it instead adds onto it "It looks like this is almost empty"
--theres a special one for only 1 left, vlowstock will take priority over lowstock, and 1 will take priority over both
ENT.selfregen = 1200 --optional, comment out/remove to not use, the time it takes in seconds for a single charge to come back without it having to be on fullcd
ENT.fullCd = 1800 --the time for when the depot goes on full cd when it runs out of stock, after it elapses, it will be full stock again
ENT.loottable = {
	--the loot table, similar format as the loot plugin
	--[id (or "none")] = chances for it to be picked,
	--none means nothing will be picked
	["none"] = 61,
	["bottleofbeer"] = 8,
	["sparklingwater"] = 2,
	["special"] = 3,
	["watercan"] = 6,
	["waterbottle"] = 6,
	["banthacheese"] = 3,
	["banthacheesewheel"] = 2,
	["banthasteak"] = 2,
	["dewbackstew"] = 2,
	["kraytdragon"] = 1,
	["ration"] = 3,
	["ratmeat"] = 12,
	["sweetroll"] = 1,
	["largepowercell"] = 1,
	["leg"] = 1,
	["body"] = 1,
	["junk1"] = 15,
	["junk2"] = 8,
	["junk3"] = 16,
	["junk4"] = 7,
	["junk5"] = 8,
	["junk6"] = 9,
	["dl44"] = 1,
	
	
}