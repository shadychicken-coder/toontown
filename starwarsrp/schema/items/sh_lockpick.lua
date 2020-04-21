ITEM.name = "Door Slicer (5)"
ITEM.desc = "A virtual interface that can be used to open doors."
ITEM.model = "models/lordtrilobite/starwars/props/imp_datatape.mdl"
ITEM.permit = "bh"
ITEM.category = "Hunting Equipment"
ITEM.uniqueID = "door_slicer"
ITEM.noBusiness = true
ITEM.price = 500

function ITEM:getDesc()
	return L("A virtual interface that can be used to open doors.", self:getData("amount", 5))
end

function ITEM:onInstanced(index, x, y, item)
	item:setData("amount", 5)
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local d = item:getData("amount", 5)

		if (d > 0) then
			nut.util.drawText(d, w - 14, h - 14, color_white, 1, 1, "nutSmallFont")
		end
	end
end

ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:isDoor()) then
			if (target:isLocked()) then
				client:setNetVar("picking", true)

				client:setAction("Slicing Door...", 3, function()
					if (client and client:IsValid()) then
						if (!client:Alive()) then return end

						local dist = client:GetPos():Distance(target:GetPos())
						client:setNetVar("picking", nil)
						if (dist < 96) then
							-- 확률
							if (math.Rand(0, 5) < 3) then
								client:notifyLocalized("Slicing failed!")
							else
								local partner = target:getDoorPartner()

								if (IsValid(partner)) then
									partner:Fire("unlock")
								end

								target:Fire("unlock")
								target:EmitSound("doors/door_latch1.wav")

								client:notifyLocalized("Slicing success!")
							end

							if (item:getData("amount", 1) <= 1) then
								item:remove()
							else
								item:setData("amount", item:getData("amount", 5) - 1)

								return false
							end
						else
							client:notifyLocalized("tooFar")
						end
					end
				end)
			else
				client:notifyLocalized("notLocked")
			end

			return false
		end

		return false
	end,
	onCanRun = function(item)
		if (IsValid(item.entity)) then return false end

		local client = item.player
		if (CLIENT) then client = LocalPlayer() end
		if (client:getNetVar("picking")) then return false end

		return true
	end
}
