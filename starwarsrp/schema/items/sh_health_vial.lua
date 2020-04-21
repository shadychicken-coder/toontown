ITEM.name = "Health Vial"
ITEM.desc = "A small vial with green liquid."
ITEM.model = "models/healthvial.mdl"
ITEM.price = 100
ITEM.permit = "doc"
ITEM.category = "Medical Equipment"
ITEM.uniqueID = "healthvial"
ITEM.noBusiness = true
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 50, 100))
	end
}
