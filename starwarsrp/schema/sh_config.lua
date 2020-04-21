-- Customize the beep sounds here, before and after voices.
SCHEMA.beepSounds = {}
SCHEMA.beepSounds[FACTION_CP] = {
	on = {
		"npc/overwatch/radiovoice/on1.wav",
		"npc/overwatch/radiovoice/on3.wav",
		"npc/metropolice/vo/on2.wav"
	},
	off = {
		"npc/metropolice/vo/off1.wav",
		"npc/metropolice/vo/off2.wav",
		"npc/metropolice/vo/off3.wav",
		"npc/metropolice/vo/off4.wav",
		"npc/overwatch/radiovoice/off2.wav",
		"npc/overwatch/radiovoice/off2.wav"
	}
}
SCHEMA.beepSounds[FACTION_OW] = {
	on = {
		"npc/combine_soldier/vo/on1.wav",
		"npc/combine_soldier/vo/on2.wav"
	},
	off = {
		"npc/combine_soldier/vo/off1.wav",
		"npc/combine_soldier/vo/off2.wav",
		"npc/combine_soldier/vo/off3.wav"
	}
}

-- Sounds play after the player has died.
SCHEMA.deathSounds = {}
SCHEMA.deathSounds[FACTION_CP] = {
	"npc/metropolice/die1.wav",
	"npc/metropolice/die2.wav",
	"npc/metropolice/die3.wav",
	"npc/metropolice/die4.wav"
}
SCHEMA.deathSounds[FACTION_OW] = {
	"npc/combine_soldier/die1.wav",
	"npc/combine_soldier/die2.wav",
	"npc/combine_soldier/die3.wav"
}

-- Sounds the player makes when injured.
SCHEMA.painSounds = {}
SCHEMA.painSounds[FACTION_CP] = {
	"npc/metropolice/pain1.wav",
	"npc/metropolice/pain2.wav",
	"npc/metropolice/pain3.wav",
	"npc/metropolice/pain4.wav"
}
SCHEMA.painSounds[FACTION_OW] = {
	"npc/combine_soldier/pain1.wav",
	"npc/combine_soldier/pain2.wav",
	"npc/combine_soldier/pain3.wav"
}

-- Combine name prefix.
SCHEMA.cpPrefix = "TK-"
SCHEMA.owPrefix = "OT-"

-- How long the Combine digits are.
SCHEMA.digitsLen = 4

-- Rank information.
SCHEMA.rctRanks = {"RCT"}
SCHEMA.unitRanks = {"CPL", "SGT", "CPT", "02", "01", "OfC"}
SCHEMA.eliteRanks = {"EpU", "DvL", "SeC"}
SCHEMA.scnRanks = {"CLAW.SCN", "SCN"}
SCHEMA.owRanks = {SCHEMA.owDefaultRank, "OWE", "OPG", "SGS", "SPG"}

SCHEMA.owDefaultRank = "OWS"

SCHEMA.rankTables = {
	[FACTION_CP] = {
		SCHEMA.rctRanks,
		SCHEMA.unitRanks,
		SCHEMA.eliteRanks,
		SCHEMA.scnRanks
	},
	[FACTION_OW] = {SCHEMA.owRanks}
}

-- What model each rank should be.
SCHEMA.rankModels = {
	["RCT"] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	[SCHEMA.unitRanks] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	["OfC"] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	["EpU"] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	["DvL"] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	["SeC"] = "models/nate159/swbf2015/npc/stormtrooper_npc.mdl",
	["SCN"] = "models/starwars/syphadias/ships/probe_droid/probe_droid.mdl",
	["CLAW.SCN"] = "models/shield_scanner.mdl"
}

SCHEMA.owRankModels = {
	[SCHEMA.owDefaultRank] = {"models/combine_soldier.mdl", 0},
	["OWE"] = {"models/combine_super_soldier.mdl", 0},
	["OPG"] = {"models/combine_soldier_prisonguard.mdl", 0},
	["SGS"] = {"models/combine_soldier.mdl", 1},
	["SPG"] = {"models/combine_soldier_prisonguard.mdl", 1},
}

-- The default player data when using /data
SCHEMA.defaultData = [[
Points:
Infractions:
]]