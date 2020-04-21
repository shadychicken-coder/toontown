nut.command.add("doorkick", {
	onRun = function(client, arguments)
		if (client:Team() == FACTION_CP) then
			local aimVector = client:GetAimVector()

			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + aimVector*96
				data.filter = client
			local entity = util.TraceLine(data).Entity

			if (IsValid(entity) and entity:GetClass() == "prop_door_rotating" or entity:isDoor()) then
				if (client:forceSequence("MeleeAttack01")) then
					timer.Simple(0.75, function()
						if (IsValid(client) and IsValid(entity)) then
							entity:EmitSound("ambient/explosions/explode_1.wav", 150)

							local force = aimVector * (360 + client:getChar():getAttrib("str", 0)*5)
							force.z = 0

							entity:blastDoor(force, 60)
						end
					end)
				end
			else
				return "@dNotValid"
			end
		else
			return "@mustBeCP"
		end
	end
})

nut.command.add("data", {
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, table.concat(arguments, " "))

		if (IsValid(target) and target:getChar()) then
			if (!hook.Run("CanPlayerViewData", client, target)) then
				return "@noViewData"
			end

			client.nutDataTarget = target
			netstream.Start(client, "plyData", target:getChar():getData("txt"), target:Name().." ["..target:getDigits().."]", hook.Run("CanPlayerEditData", client, target))
		end
	end
})
nut.command.add("search", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local class = char:getClass()
		local classData = nut.class.list[class]

		if (classData.law) then
			traceData = {}
			traceData.start = client:GetShootPos()
			traceData.endpos = traceData.start + client:GetAimVector() * 256
			traceData.filter = client
			trace = util.TraceLine(traceData)

			local target = trace.Entity
			
			if (IsValid(target)) then
				hook.Run("OnPlayerSearch", client, target)
				
				nut.log.add(client, "search", target)
			end
		else
			client:notifyLocalized("notLaw")
		end
	end,
	--alias = {"수색"}
})

nut.command.add("objectives", {
	onRun = function(client, arguments)
		if (hook.Run("CanPlayerViewObjectives", client)) then
			netstream.Start(client, "obj", SCHEMA.objectives, hook.Run("CanPlayerEditObjectives", client))
		else
			return "@noViewObj"
		end
	end
})

nut.command.add("setpriority", {
	syntax = "<number id> [bool status]",
	onRun = function(client, arguments)
		if (!client:isCombine()) then
			return "@notCombine"
		end

		local id = tonumber(arguments[1])
		local status = util.tobool(arguments[2])

		if (!status) then
			status = nil
		end

		for k2, v2 in pairs(nut.item.instances) do
			if (v2.uniqueID == "cid" and v2:getData("id", 0) == id) then
				v2:setData("cwu", status)

				return "@prioritySet", v2:getData("name", "John Doe")
			end
		end

		return "@plyNoExist"
	end
})

nut.command.add("request", {
	syntax = "<string text>",
	onRun = function(client, arguments)
		if ((client.nutNextReq or 0) < CurTime()) then
			local text = table.concat(arguments, " ")
			local item = client:getChar():getInv():hasItem("request")

			if (item) then
				if (text:find("%S")) then
					client.nutNextReq = CurTime() + 5
					nut.chat.send(client, "request", "["..item:getData("name", client:Name())..", "..item:getData("id", "ERROR").."] "..text)

					return client:EmitSound("buttons/combine_button5.wav", 50, 40)
				end
			else
				return "@noReqDev"
			end

			client.nutNextReq = CurTime() + 1
			client:EmitSound("buttons/combine_button3.wav", 75, 150)
		end
	end
})