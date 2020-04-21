ITEM.name = "Bar Table #1"
ITEM.desc = "A table used for drinking or dining"
ITEM.model = "models/cire992/props4/bar_table_02.mdl"
ITEM.category = "Furniture"
ITEM.factions = {FACTION_ADMIN}
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_bartable"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}