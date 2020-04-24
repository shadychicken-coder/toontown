ITEM.name = "Alien Worm Food"
ITEM.desc = "An unknown creature, butchered and prepared."
ITEM.price = 15
ITEM.model = "models/clutter/alienwormfood.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "wormfood"
ITEM.noBusiness = true
ITEM.hungerAmt = 17
ITEM.thirstAmt = -4

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
