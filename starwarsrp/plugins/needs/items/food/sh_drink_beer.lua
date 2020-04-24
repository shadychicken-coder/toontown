ITEM.name = "Corellian Ale"
ITEM.desc = "A foggy green bottle of ale."
ITEM.price = 90
ITEM.model = "models/mosi/skyrim/fooddrink/firebrandwine.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Drinks"
ITEM.uniqueID = "bottleofbeer"
ITEM.noBusiness = true
ITEM.hungerAmt = 0
ITEM.thirstAmt = 12
ITEM.alcrem = 2

--ITEM.playsound = "npc/barnacle/barnacle_gulp1.wav"

local function onUse(item)
	 
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
