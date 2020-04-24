local PLUGIN = PLUGIN

--config list of language tables for creating the commands/chat types for them
local languages = {
	{"lang_droidspeak", "droid", "Droid Speak", {
		ic = {"/droid", "/droidspeak"},
		w = {"/droidw", "/droidspeakw"},
		y = {"/droidy", "/droidspeaky"},
		radio = {"/droidr", "/droidspeakr"},
		radiow = {"/droidrw", "/droidspeakrw"},
	}},
	{"lang_mando", "mando", "Mando'a", {
		ic = {"/mando", "/mandoa"},
		w = {"/mandow", "/mandoaw"},
		y = {"/mandoy", "/mandoay"},
		radio = {"/mandor", "/mandoar"},
		radiow = {"/mandorw", "/mandoarw"},
	}},
	{"lang_shyriiwook", "wook", "Wookie", {
		ic = {"/wook", "/wookie"},
		w = {"/wookw", "/wookiew"},
		y = {"/wooky", "/wookiey"},
		radio = {"/wookr", "/woookier"},
		radiow = {"/wookrw", "/wookierw"},
	}},
	{"lang_huttese", "hutt", "Huttese", {
		ic = {"/hut", "/huttese"},
		w = {"/hutw", "/huttesew"},
		y = {"/huty", "/huttesey"},
		radio = {"/hutr", "/hutteser"},
		radiow = {"/hutrw", "/hutteserw"},
	}},
	{"lang_dosh", "dosh", "Trandoshan", {
		ic = {"/dosh", "/trandoshan"},
		w = {"/doshw", "/trandoshanw"},
		y = {"/doshy", "/trandoshany"},
		radio = {"/doshr", "/trandoshanr"},
		radiow = {"/doshrw", "/trandoshanrw"},
	}},
	{"lang_rodese", "rod", "Rodese", {
		ic = {"/rod", "/rodese"},
		w = {"/rodw", "/rodesew"},
		y = {"/rody", "/rodesey"},
		radio = {"/rodr", "/rodeser"},
		radiow = {"/rodrw", "/rodeserw"},
	}},
	{"lang_sign", "sign", "Sign Language", {
		ic = {"/sign"}
	}},
}

hook.Add("IsRecognizedChatType", "langtypes", function(type)
	for k,v in pairs(languages) do
		if(string.find(type, v[2])) then
			return true
		end
	end
end)
local function starts_with(str, start)
	return str:sub(1, #start) == start
end

hook.Add("ChatFormatCheck", "langs", function(type)
	for k,v in pairs(languages) do
		if(starts_with(type, v[2])) then
			return true
		end
	end
end)

--whisper Color(color.r - 35, color.g - 35, color.b - 35)
--yell Color(color.r + 35, color.g + 35, color.b + 35)

--im using the language chat formatting from respite, sorry, imo theres not rly a better way to format it so
--this should make it so the file is so much smaller, and its easy to add new ones
--it shoooould work but u never know with gmod
function genChat(trait, chatbasename, lang, prefixtable)
	--a special one for this
	if(chatbasename == "sign") then
		local chatType = chatbasename
		nut.chat.register(chatType, {
			desc = "'Talk' in sign language, only people looking at you in chat range can see it",
			onCanSay = function(speaker, text)
				return nut.traits.hasTrait(speaker, trait) and speaker:Alive()
			end,
			onChatAdd = function(speaker, text, anonymous)
				local color = nut.chat.classes.ic.onGetColor(speaker, text)
				local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")
				
				if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
					chat.AddText(color, name.." signs, \""..text.."\"")
				else
					chat.AddText(color, name.." signs something.")
				end
			end,
			onCanHear = function(speaker, listener)
				local range = (nut.config.get("chatRange", 280) ^ 2)
				local inrange = (speaker:GetPos() - listener:GetPos()):LengthSqr() <= range

				if(inrange) then
					--still bad at angles and math, taken from a thread on facepunch i found
					local eyeToMonster = (speaker:GetPos() - listener:EyePos()):GetNormalized() -- Normalized direction to the monster
					local degreeLimit = listener:GetFOV() -- FOV
					local dotProduct = eyeToMonster:Dot(listener:EyeAngles():Forward()) -- How similar is the player's aim direction to the direction of the monster?
					local aimDegree = math.deg(math.acos(dotProduct)) -- Convert similarity to degrees
					-- If the degree difference in similarity is bigger than the player's FOV, then most likely it isn't being rendered

						--should return true when theyre on screen
					return (aimDegree < degreeLimit)
				end
				return false
			end,
			prefix = prefixtable.ic
		})
		return --dont need one
	end

	--normal
	local des = "Talk normally in "..lang
	local chatType = chatbasename
	nut.chat.register(chatType, {
		desc = des,
		onCanSay = function(speaker, text)
			return nut.traits.hasTrait(speaker, trait) and !nut.traits.hasTrait(speaker, "big_mute") and speaker:Alive()
		end,
		onChatAdd = function(speaker, text, anonymous)
			local color = nut.chat.classes.ic.onGetColor(speaker, text)
			local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")
			
			if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
				chat.AddText(color, name.." says in "..lang..", \""..text.."\"")
			else
				chat.AddText(color, name.." says something in "..lang..".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280),
		prefix = prefixtable.ic
	})

	--w
	des = "Whisper in "..lang
	local chatType = chatbasename.."w"
	nut.chat.register(chatType, {
		desc = des,
		onCanSay = function(speaker, text)
			return nut.traits.hasTrait(speaker, trait) and !nut.traits.hasTrait(speaker, "big_mute") and speaker:Alive()
		end,
		onChatAdd = function(speaker, text)
			local color = nut.chat.classes.ic.onGetColor(speaker, text)
			local real = Color(color.r - 35, color.g - 35, color.b - 35)
			
			local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")

			if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
				chat.AddText(real, name.." whispers in "..lang..", \""..text.."\"")
			else
				chat.AddText(real, name.." whispers something in "..lang..".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280) * .25,
		prefix = prefixtable.w
	})

	--y
	des = "Yell in "..lang
	local chatType = chatbasename.."y"
	nut.chat.register(chatType, {
		desc = des,
		onCanSay = function(speaker, text)
			return nut.traits.hasTrait(speaker, trait) and !nut.traits.hasTrait(speaker, "big_mute") and speaker:Alive()
		end,
		onChatAdd = function(speaker, text)
			local color = nut.chat.classes.ic.onGetColor(speaker, text)
			local real = Color(color.r + 35, color.g + 35, color.b + 35)
			local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")
			if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
				chat.AddText(real, name.." yells in "..lang..", \""..text.."\"")
			else
				chat.AddText(real, name.." yells something in "..lang..".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280) * 2,
		prefix = prefixtable.y
	})

	--radio stuff
	local RADIO_CHATCOLOR = Color(100, 255, 50)
	-- Yelling out loud.
	local find = {
		["imp_main"] = true,
		["radio"] = false,
		["sradio"] = true
	}
	local function endChatter(listener)
		timer.Simple(1, function()
			if (!listener:IsValid() or !listener:Alive() or hook.Run("ShouldRadioBeep", listener) == false) then
				return false
			end

			listener:EmitSound("npc/metropolice/vo/off"..math.random(1, 3)..".wav", math.random(10, 30), math.random(80, 120))
		end)
	end

	des = "Talk into a radio you have or your commlink cyberware in "..lang
	local chatType = chatbasename.."radio"
	nut.chat.register(chatType, {
		desc = des,
		font = "nutRadioFont",
		onChatAdd = function(speaker, text)
			local real = nut.chat.classes.radio.onGetColor(speaker, text)
			local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")
			
			if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
				chat.AddText(real, name.." says in radio in "..lang..": \""..text.."\"")
			else
				chat.AddText(real, name.." says in radio something in "..lang..".")
			end
		end,
		onCanHear = function(speaker, listener)
			local dist = speaker:GetPos():Distance(listener:GetPos())
			local speakRange = nut.config.get("chatRange", 280)
			local listenerEnts = ents.FindInSphere(listener:GetPos(), speakRange)
			local listenerInv = listener:getChar():getInv()
			local freq
	
			if (!CURFREQ or CURFREQ == "") then
				return false
			end
	
			--stop talking to other people if theyre talking via commlink
			if (dist <= speakRange) then
				return true
			end
	
			if(listener:getNetVar("isjammed")) then return false end

			if (listenerInv) then
				for k, v in pairs(listenerInv:getItems()) do
					if (freq) then
						break
					end
	
					for id, far in pairs(find) do
						if (v.uniqueID == id and v:getData("power", false) == true) then
							if (CURFREQ == v:getData("freq", "000.0")) then
								endChatter(listener)
								
								return true
							end
	
							break
						end
					end
				end
			end
	
			if (!freq) then
				for k, v in ipairs(listenerEnts) do
					if (freq) then
						break
					end
	
					if (v:GetClass() == "nut_item") then
						local itemTable = v:getItemTable()
	
						for id, far in pairs(find) do
							if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
								if (CURFREQ == v:getData("freq", "000.0")) then
									endChatter(listener)
	
									return true
								end
							end
						end
					end
				end
			end
	
			return false
		end,
		onCanSay = function(speaker, text)
			if((!nut.traits.hasTrait(speaker, trait) or nut.traits.hasTrait(speaker, "big_mute")) or !speaker:Alive()) then return false end

			local schar = speaker:getChar()
			local speakRange = nut.config.get("chatRange", 280)
			local speakEnts = ents.FindInSphere(speaker:GetPos(), speakRange)
			local speakerInv = schar:getInv()
			local freq
	
			if (speakerInv) then
				for k, v in pairs(speakerInv:getItems()) do
					if (freq) then
						break
					end
	
					for id, far in pairs(find) do
						if (v.uniqueID == id and v:getData("power", false) == true) then
							freq = v:getData("freq", "000.0")
	
							break
						end
					end
				end
			end
	
			if (!freq) then
				for k, v in ipairs(speakEnts) do
					if (freq) then
						break
					end
	
					if (v:GetClass() == "nut_item") then
						local itemTable = v:getItemTable()
	
						for id, far in pairs(find) do
							if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
								freq = v:getData("freq", "000.0")
	
								break
							end
						end
					end
				end
			end
	
			if (freq) then
				if(speaker:getNetVar("isjammed")) then speaker:notify("Something is preventing you from using the radio.") return end
	
				CURFREQ = freq
				--if(!speakerInv:hasItem("imp_main", {power = true})) then
					speaker:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", math.random(40, 60), math.random(80, 120))
				--end
			else
				speaker:notifyLocalized("radioNoRadioComm")
				return false
			end
		end,
		prefix = prefixtable.radio
	})

	des = "Whisper into a radio you have in "..lang
	local chatType = chatbasename.."radiow"
	nut.chat.register(chatType, {
		desc = des,
		font = "nutRadioFont",
		onChatAdd = function(speaker, text)
			local real = nut.chat.classes.radiow.onGetColor(speaker, text)
			local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")
			
			if(nut.traits.hasTrait(LocalPlayer(), trait)) then-- or LocalPlayer():getChar():getImplants("implants", "autotrans")) then--Data("implants", {})["autotrans"]) then
				chat.AddText(real, name.." whispers in radio in "..lang..": \""..text.."\"")
			else
				chat.AddText(real, name.." whispers in radio something in "..lang..".")
			end
		end,
		onCanHear = function(speaker, listener)
			local dist = speaker:GetPos():Distance(listener:GetPos())
			local speakRange = nut.config.get("chatRange", 280) * 0.25
			local listenerEnts = ents.FindInSphere(listener:GetPos(), speakRange)
			local listenerInv = listener:getChar():getInv()
			local freq
	
			if (!CURFREQ or CURFREQ == "") then
				return false
			end
	
			--stop talking to other people if theyre talking via commlink
			if (dist <= speakRange) then
				return true
			end

			if(listener:getNetVar("isjammed")) then return false end
	
			if (listenerInv) then
				for k, v in pairs(listenerInv:getItems()) do
					if (freq) then
						break
					end
	
					for id, far in pairs(find) do
						if (v.uniqueID == id and v:getData("power", false) == true) then
							if (CURFREQ == v:getData("freq", "000.0")) then
								endChatter(listener)
								
								return true
							end
	
							break
						end
					end
				end
			end
	
			if (!freq) then
				for k, v in ipairs(listenerEnts) do
					if (freq) then
						break
					end
	
					if (v:GetClass() == "nut_item") then
						local itemTable = v:getItemTable()
	
						for id, far in pairs(find) do
							if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
								if (CURFREQ == v:getData("freq", "000.0")) then
									endChatter(listener)
	
									return true
								end
							end
						end
					end
				end
			end
	
			return false
		end,
		onCanSay = function(speaker, text)
			if((!nut.traits.hasTrait(speaker, trait) or nut.traits.hasTrait(speaker, "big_mute")) or !speaker:Alive()) then return false end

			local schar = speaker:getChar()
			local speakRange = nut.config.get("chatRange", 280) * 0.25
			local speakEnts = ents.FindInSphere(speaker:GetPos(), speakRange)
			local speakerInv = schar:getInv()
			local freq
	
			if (speakerInv) then
				for k, v in pairs(speakerInv:getItems()) do
					if (freq) then
						break
					end
	
					for id, far in pairs(find) do
						if (v.uniqueID == id and v:getData("power", false) == true) then
							freq = v:getData("freq", "000.0")
	
							break
						end
					end
				end
			end
	
			if (!freq) then
				for k, v in ipairs(speakEnts) do
					if (freq) then
						break
					end
	
					if (v:GetClass() == "nut_item") then
						local itemTable = v:getItemTable()
	
						for id, far in pairs(find) do
							if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
								freq = v:getData("freq", "000.0")
	
								break
							end
						end
					end
				end
			end
	
			if (freq) then
				if(speaker:getNetVar("isjammed")) then speaker:notify("Something is preventing you from using the radio.") return end
	
				CURFREQ = freq
				--if(!speakerInv:hasItem("imp_main", {power = true})) then
					speaker:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", math.random(40, 60), math.random(80, 120))
				--end
			else
				speaker:notifyLocalized("radioNoRadioComm")
				return false
			end
		end,
		prefix = prefixtable.radiow
	})
end

for k,v in pairs(languages) do
	genChat(v[1], v[2], v[3], v[4])
end