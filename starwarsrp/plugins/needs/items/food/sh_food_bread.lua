ITEM.name = "Bread"
ITEM.desc = "A piece of bread."
ITEM.model = "models/bread/bread.mdl"
ITEM.uniqueID = "bread"
ITEM.hungerAmt = 35
ITEM.thirstAmt = 5
ITEM.noBusiness = true
local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)