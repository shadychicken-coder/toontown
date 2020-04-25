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
ENT.stock = 12
ENT.lowstock = 5
ENT.vlowstock = 3
ENT.fullCd = 600
ENT.loottable = {
	["none"] = 51,
	["metalscraps"] = 10,
	["component"] = 9,
	["fusion_cutter"] = 3,
	["weaponpart"] = 3,
	["motor"] = 5,
	["tin"] = 8,
	["largepowercell"] = 2,
	["powercell"] = 2,
	["coolant"] = 4,
	["head"] = 5,
	["leg"] = 4,
	["body"] = 2,
	["junk1"] = 6,
	["junk2"] = 6,
	["junk3"] = 5,
	["junk4"] = 3,
	["junk5"] = 2,
	["junk6"] = 7,
	["ratmeat"] = 12,
	["weaponhl2axe"] = 2,
	["weaponhl2hook"] = 2,
	["weaponhl2pipe"] = 2,
	["weaponhl2pot"] = 4,
	["weaponhl2shovel"] = 4,
	["dl44"] = 1,


}