local PLUGIN = PLUGIN

PLUGIN.skilllist = {
	--[[
	[""] = {
		name = "",
		desc = "",
		price = 0,
		--model = "",
		skillgive = "",
		skillval = 1,
		skillreq = {[""] = 1}
	},
	]]
	["sb_droid"] = {
		name = "Beginner's Guide to Droid Speak",
		desc = "Teaches you Droid Speak.",
		price = 10000,
		--model = "",
		skillgive = "lang_droidspeak",
		skillval = 1,
		skillreq = {[""] = 1}
	},
	
	--[[
	["sb_imp1"] = {
		name = "Cyberware Knowledge Level 1",
		desc = "item that gives you cyberware level 1, requires medical level 2",
		price = 4200,
		--model = "",
		skillgive = {["tech_imp"] = 1},
		skillval = 1,
		skillreq = {["tech_med"] = 2}--{[""] = 1}
	},
	["sb_imp2"] = {
		name = "Cyberware Knowledge Level 2",
		desc = "item that gives you cyberware level 2",
		price = 9600,
		--model = "",
		skillgive = "tech_imp",
		skillval = 2,
		skillreq = {["tech_imp"] = 1},
		--skillconflict = {["gate_imp"] = true},
	},
	["sb_imp3"] = {
		name = "Cyberware Knowledge Level 3",
		desc = "item that gives you cyberware level 3",
		price = 19200,
		--model = "",
		skillgive = "tech_imp",
		skillval = 3,
		skillreq = {["tech_imp"] = 2},
		--skillconflict = {["gate_imp"] = true},
	},]]
	


function PLUGIN:InitializedPlugins()
    do
		for id, data in pairs(self.skilllist) do
			local ITEM = nut.item.register(id, "base_skillbook", nil, nil, true)
			ITEM.name = data.name
			ITEM.desc = data.desc
			ITEM.price = data.price or 0
			ITEM.model = "models/props_lab/binderblue.mdl"
			if(data.model) then
				ITEM.model = data.model
			end

			--tbh these could have lit permit?

			ITEM.skillgive = data.skillgive --skill to give
			ITEM.skillval = data.skillval --value to set, true for non-level abilities, number for level to set to
			ITEM.skillreq = data.skillreq --requirements for using the book, value would be similar to skillval
			ITEM.skillconflict = data.skillconflict
			
		end
	end
end