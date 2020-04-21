ITEM.name = "Restraining Cuffs"
ITEM.desc = "A bundle of rope used for restraining and searching players.."
ITEM.price = 200
ITEM.height = 1
ITEM.width = 2
ITEM.uniqueID = "j_leather_string"
ITEM.model = "models/Items/CrossbowRounds.mdl"
ITEM.permit = "bh"
ITEM.category = "Hunting Equipment"
ITEM.noBusiness = true


ITEM:hook("Use", function(item)
	item.player:notify("You have used restraining cuffs.")
	item.player:Say("/me has used restraining cuffs on the person infront of them.")
end)
ITEM:hook("drop", function(item)
	item.player:SendLua([[surface.PlaySound("physics/cardboard/cardboard_box_impact_soft7.wav")]])
	item.player:Say("/me has dropped restraining cuffs.")
end)
ITEM.functions.Use = {
	onRun = function(item)
		if (item.beingUsed) then
			return false
		end

		local client = item.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:getChar() and !target:getNetVar("tying") and !target:getNetVar("restricted")) then
			item.beingUsed = true

			client:EmitSound("physics/plastic/plastic_barrel_strain"..math.random(1, 3)..".wav")
			client:setAction("@tying", 5)
			client:doStaredAction(target, function()
				item:remove()

				target:setRestricted(true)
				target:setNetVar("tying")

				client:EmitSound("npc/barnacle/neck_snap1.wav", 100, 140)
			end, 5, function()
				client:setAction()

				target:setAction()
				target:setNetVar("tying")

				item.beingUsed = false
			end)

			target:setNetVar("tying", true)
			target:setAction("@beingTied", 5)
		else
			item.player:notifyLocalized("plyNotValid")
		end

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}

function ITEM:onCanBeTransfered(inventory, newInventory)
	return !self.beingUsed
end