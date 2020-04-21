FACTION.name = "Imperial"
FACTION.desc = "Agents of the Galactic Empire"
FACTION.color = Color(255, 0, 0)
FACTION.isDefault = false
--FACTION.limit = 0.25
FACTION.models = {
	"models/nate159/swbf2015/npc/stormtrooper_npc.mdl", 
}
FACTION.weapons = {
	"weapon_752bf3_e11",
	"nut_stunstick",
	"weapon_752bf3_dh17",

}

FACTION.pay = 25
FACTION.isGloballyRecognized = true

function FACTION:onGetDefaultName(client, digits)
	if (SCHEMA.digitsLen >= 1) then
		digits = digits or math.random(
			tonumber("1"..string.rep("0", SCHEMA.digitsLen-1)),
			tonumber(string.rep("9", SCHEMA.digitsLen))
		)

		local name = SCHEMA.cpPrefix
			..table.GetFirstValue(SCHEMA.rctRanks)
			.."."
			..digits
		return name, true
	else
		return SCHEMA.cpPrefix..table.GetFirstValue(SCHEMA.rctRanks), true
	end
end

function FACTION:onTransfered(client, oldFaction)
	local digits

	if (oldFaction.index == FACTION_CITIZEN) then
		local inventory = client:getChar():getInv()
		if (inventory) then
			for _, item in pairs(inventory:getItems()) do
				if (item.uniqueID == "cid" and item:getData("id")) then
					digits = item:getData("id")
					break
				end
			end
		end
	elseif (oldFaction.index == FACTION_OW) then
		digits = client:getDigits()
	elseif (oldFaction.index == FACTION_CP) then
		return
	end

	client:getChar():setName(self:onGetDefaultName(client, digits))
	hook.Run("PlayerLoadout", client)
end

FACTION_CP = FACTION.index

