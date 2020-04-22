ITEM.name = "Mouse Droid"
ITEM.desc = "WARNING: If you place this droid, you will only have it for decoration. Keep it in your inventory if you'd like to sell it."
ITEM.model = "models/kingpommes/starwars/playermodels/mouse.mdl"
ITEM.price = 1000
ITEM.height = 3
ITEM.width = 2
ITEM.uniqueID = "mouse"
ITEM.noBusiness = true
ITEM.functions.Place = {
	onRun = function(item)
		local data = {}
		data.start = item.player:GetShootPos()
		data.endpos = data.start + item.player:GetAimVector()*128
		data.filter = item.player
		
		if (IsValid(scripted_ents.Get("nut_mouse"):SpawnFunction(item.player, util.TraceLine(data)))) then
			item.player:EmitSound("npc/roller/mine/rmine_blades_out3.wav", 100, 90)
		else
			return false
		end
	end
}