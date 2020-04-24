ITEM.name = "Cheese Wheel"
ITEM.desc = "A large WHEEL of Bantha Cheese."
ITEM.price = 30
ITEM.model = "models/mosi/skyrim/fooddrink/cheesewheel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "banthacheesewheel"
ITEM.noBusiness = true
ITEM.hungerAmt = 27
ITEM.thirstAmt = -20

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
