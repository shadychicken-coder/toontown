ITEM.name = "Lothal Spicebrew"
ITEM.model = "models/myproject/mesh_0707.mdl"
ITEM.desc = "Slightly increases stamina."
ITEM.duration = 100
ITEM.price = 100
ITEM.permit = "bartending"
ITEM.category = "Alcohol"
ITEM.uniqueID = "lothalspicebrew"
ITEM.attribBoosts = {
	["stm"] = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("items/battery_pickup.wav")
	item.player:ScreenFade(1, Color(140, 0, 200, 100), 4, 15)
end)


