ITEM.name = "Good Chair"
ITEM.desc = "A nice, well crafted chair"
ITEM.model = "models/lordtrilobite/starwars/props/imp_chair01.mdl"
ITEM.category = "Furniture"
ITEM.factions = {FACTION_ADMIN}
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_goodchair"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}