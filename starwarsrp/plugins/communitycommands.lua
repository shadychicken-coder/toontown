PLUGIN.name = "Community Commands"
PLUGIN.author = "Voluntary Gaming"
PLUGIN.desc = "Adds /group, /content, /rules and /eventlocal"

-- IC Related Shit

nut.chat.register("eventlocal", {
	onCanSay =  function(speaker, text)
		return speaker:IsAdmin()
	end,
	onCanHear = nut.config.get("chatRange", 280) * 6,
	onChatAdd = function(speaker, text)
		chat.AddText(Color(255, 150, 0), text)
	end,
	prefix = {"/eventlocal"},
	font = "nutMediumFont"
})

-- Community Related Shit

nut.command.add("group", {
    syntax = "",
	onRun = function(client, arguments)
	 client:SendLua([[gui.OpenURL("https://steamcommunity.com/groups/GGNRoleplay")]])
	end
})


nut.command.add("content", {
    syntax = "",
	onRun = function(client, arguments)
	 client:SendLua([[gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=819000652")]])
	end
})

nut.command.add("rules", {
    syntax = "",
	onRun = function(client, arguments)
	 client:SendLua([[gui.OpenURL("https://steamcommunity.com/groups/GGNRoleplay/discussions/0/4379130600469340764/")]])
	end
})

