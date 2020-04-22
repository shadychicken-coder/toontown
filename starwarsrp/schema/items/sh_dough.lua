ITEM.name = "Dough"
ITEM.desc = "A bag of dough. Used for making bread."
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.noBusiness = true
ITEM.functions.Use = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_dough"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("physics/body/body_medium_impact_soft4.wav", 100, 90)
		else
			return false
		end
	end
}