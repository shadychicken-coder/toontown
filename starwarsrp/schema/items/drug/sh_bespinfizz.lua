ITEM.name = "Bespin Fizz"
ITEM.model = "models/myproject/mesh_0706.mdl"
ITEM.desc = "Slightly increases strength and endurance."
ITEM.duration = 100
ITEM.price = 100
ITEM.permit = "bartending"
ITEM.category = "Alcohol"
ITEM.uniqueID = "bespinfizz"
ITEM.noBusiness = true
ITEM.attribBoosts = {
	["str"] = 5,
	["en"] = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("items/battery_pickup.wav")
	item.player:ScreenFade(1, Color(140, 0, 200, 100), 4, 15)
end)

