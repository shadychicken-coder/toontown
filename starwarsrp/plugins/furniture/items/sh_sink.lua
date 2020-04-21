ITEM.name = "Kitchen Sink"
ITEM.desc = "Hot water is NOT a guarntee."
ITEM.model = "models/cire992/props/kitchen04.mdl"
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
		
		if (IsValid(scripted_ents.Get("nut_sink"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}