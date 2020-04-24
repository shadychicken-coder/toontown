AddCSLuaFile()

local PLUGIN = PLUGIN

ENT.Base = "sky_depot_base"
ENT.PrintName = "Metal Scrap Depot"
ENT.Category = "Depots"
ENT.Author = "sky"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.RenderGroup = RENDERGROUP_OPAQUE


ENT.name = "Scrap Pile"
ENT.desc = "A pile of various metal scraps."
ENT.model = "models/props_debris/concrete_floorpile01a.mdl" --better thing pls
ENT.mat = "models/props_pipes/destroyedpipes01a" --optional to overwrite material
ENT.action = "Searching..."
ENT.timeUse = 3 --how long to hold it
ENT.cooldownTime = 160 --idk
ENT.stock = 10
ENT.lowstock = 5
ENT.vlowstock = 3
ENT.fullCd = 600
ENT.loottable = {
	["none"] = 51,
	["metalscraps"] = 12,
	["component"] = 6,
	["fusion_cutter"] = 3,
	["motor"] = 5,
	["tin"] = 3,
	["largepowercell"] = 1,
	["powercell"] = 1,
	["head"] = 9,
	["leg"] = 6,
	["body"] = 2,
	["junk1"] = 4,
	["junk2"] = 4,
	["junk3"] = 4,
	["junk4"] = 4,
	["junk5"] = 4,
	["junk6"] = 4,
	["ratmeat"] = 6,
	["dl44"] = 1,


}