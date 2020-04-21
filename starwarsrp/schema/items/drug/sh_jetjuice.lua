ITEM.name = "Jet Juice"
ITEM.model = "models/myproject/mesh_0705.mdl"
ITEM.desc = "Greatly increases stamina and endurance."
ITEM.duration = 100
ITEM.price = 250
ITEM.permit = "bartending"
ITEM.category = "Alcohol"
ITEM.uniqueID = "jetjuice"
ITEM.attribBoosts = {
	["end"] = 20,
	["stm"] = 20,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("items/battery_pickup.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
