ITEM.name = "Examination Table"
ITEM.desc = "A table designed for medical and torture purposes."
ITEM.model = "models/cire992/props3/examinationtabledirty01.mdl"
ITEM.category = "Furniture"
ITEM.factions = {FACTION_ADMIN}
ITEM.width = 1
ITEM.height = 1
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_torturetable"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}