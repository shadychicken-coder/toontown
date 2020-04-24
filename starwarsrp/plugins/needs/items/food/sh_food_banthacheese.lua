ITEM.name = "Bantha Cheese"
ITEM.desc = "A small wedge of cheese."
ITEM.price = 15
ITEM.model = "models/mosi/skyrim/fooddrink/cheesewedge.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "banthacheese"
ITEM.noBusiness = true
ITEM.hungerAmt = 8
ITEM.thirstAmt = 1

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
