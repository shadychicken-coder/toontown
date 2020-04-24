ITEM.name = "Dewback Stew"
ITEM.desc = "A thick soup contained various herbs and a chunks of meat from a Dewback."
ITEM.price = 20
ITEM.model = "models/mosi/skyrim/fooddrink/stew.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "dewbackstew"
ITEM.noBusiness = true
ITEM.hungerAmt = 12
ITEM.thirstAmt = 6

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
