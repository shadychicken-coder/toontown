ITEM.name = "Krayt Dragon Steak"
ITEM.desc = "A tender cut of meat from a Krayt Dragon. Delicious, but expensive."
ITEM.price = 200
ITEM.model = "models/mosi/skyrim/fooddrink/horker.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "kraytdragon"
ITEM.noBusiness = true
ITEM.hungerAmt = 35
ITEM.thirstAmt = 5

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
