ITEM.name = "Alien Squid Food"
ITEM.desc = "An unknown Squid species, butchered and prepared."
ITEM.price = 15
ITEM.model = "models/clutter/aliensquidfood.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Foods"
ITEM.uniqueID = "squidfood"
ITEM.noBusiness = true
ITEM.hungerAmt = 12
ITEM.thirstAmt = 1

local function onUse(item)
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
