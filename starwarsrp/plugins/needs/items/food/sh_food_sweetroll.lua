ITEM.name = "Sweet Roll"
ITEM.desc = "Homegirl will snatch a baked good. Careful."
ITEM.price = 25
ITEM.model = "models/mosi/skyrim/fooddrink/sweetroll.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "sweetroll"
ITEM.noBusiness = true
ITEM.hungerAmt = 7
ITEM.thirstAmt = -5

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
