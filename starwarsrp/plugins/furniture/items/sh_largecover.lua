ITEM.name = "Large Cover"
ITEM.desc = "A large barricade used for engagements."
ITEM.model = "models/cire992/props2/wall_cover01_l.mdl"
ITEM.category = "Furniture"
ITEM.factions = {FACTION_ADMIN}
ITEM.height = 2
ITEM.width = 2
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_largecover"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}