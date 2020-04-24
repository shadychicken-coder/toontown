ITEM.name = "Water Bottle" --what are bottles that come like this commercially called?"
ITEM.desc = "A commercial water bottle."
ITEM.price = 25
ITEM.model = "models/props/cs_office/water_bottle.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.permit = "food"
ITEM.category = "Drinks"
ITEM.uniqueID = "waterbottle"
ITEM.noBusiness = true
ITEM.hungerAmt = 0
ITEM.thirstAmt = 12

ITEM.regenStam = {
	--amount, seconds
	15, 30
}

local function onUse(item)
	--item.player:restoreStamina(15)
	 
	--item.player:EmitSound("items/medshot4.wav", 80, 110)
	--item.player:ScreenFade(1, Color(0, 255, 0, 100), .4, 0)
end
ITEM:hook("use", onUse)
