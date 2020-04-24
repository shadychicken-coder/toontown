ITEM.name = "Rat Meat"
ITEM.desc = "A cut of meat from various rat-like creatures."
ITEM.price = 10
ITEM.model = "models/mosi/skyrim/fooddrink/skeever.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "ratmeat"
ITEM.noBusiness = true
ITEM.hungerAmt = 5
ITEM.thirstAmt = 1

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
