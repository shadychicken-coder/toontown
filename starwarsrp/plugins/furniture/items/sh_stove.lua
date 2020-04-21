ITEM.name = "Kitchen Stove"
ITEM.desc = "A beautiful stove!"
ITEM.model = "models/cire992/props/kitchen05.mdl"
ITEM.category = "Furniture"
ITEM.height = 1
ITEM.width = 1
ITEM.factions = {FACTION_ADMIN}
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_stove"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}