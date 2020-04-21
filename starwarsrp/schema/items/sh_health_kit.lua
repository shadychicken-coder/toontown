ITEM.name = "Health Kit"
ITEM.desc = "A large medical kit capable of more healing."
ITEM.model = "models/items/healthkit.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "doc"
ITEM.category = "Medical Equipment"
ITEM.uniqueID = "healthpack"
ITEM.noBusiness = true
ITEM.price = 200
ITEM.iconCam = {
	pos = Vector(5, 0, 30),
	ang = Angle(90, 0, 0),
	fov = 45,
}
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 50, 100))
	end
}
