ITEM.name = "Ration"
ITEM.desc = "A bag of strange slop that feels like goo."
ITEM.price = 15
ITEM.model = "models/weapons/w_package.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "ration"
ITEM.noBusiness = true
ITEM.hungerAmt = 17
ITEM.thirstAmt = -4
ITEM.alcrem = -2
ITEM.dontalch = true

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
