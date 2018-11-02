local discordia = require('discordia')
local client = discordia.Client()
heartbeat = {interval, time}
spam = {}
function io.parse(file)
for line in io.lines(file) do
	assert(loadstring(line))()
	table.insert(lines,line)
end
return lines
end
owners = {
	"Tanner#4921",
	"Sir Hoopsalot#0887"
}
allies = {
	"459088730196541440", --Delilah
	"245394957072859136", --Loki
	"129080441108955136", --Maeri
	"345667021234634754", --Temmia
	"453386308048388097", --cookie
	"157557940872544256" --malachi
}
luadocs = require "Hoopsabot/LuaDocs/docs"
udata = {} gdata = {}
udata.Currencies={}
udata.rpgStats={}
udata.rpg={}
udata.pref = {}
battles = {}
market = require "Hoopsabot/market"
usermenu = {}
function hide(value,ret,loss)
if value then return ret else return loss end
end
metas = {}
metas.Currency = {}
metas.User = {}
metas.Version = "test20"
modules = {}
modules.external = require "Hoopsabot/Modules/functionexternal"
modules.test = require "Hoopsabot/Modules/test"
modules.toggle = {}
modules.toggle.core = true
modules.toggle.test = false
modules.toggle.fun = true
modules.toggle.serveri = true
modules.toggle.currency = true
modules.toggle.debug = true
configs = {}
configs.system = require "Hoopsabot/Configs/System"
configs.autoleave = require "Hoopsabot/Configs/autoleave"
configs.ignore = require "Hoopsabot/Configs/ignore"
configs.images = require "Hoopsabot/Configs/images"
configs.blocks = require "Hoopsabot/Configs/blocks"
configs.autorole = require "Hoopsabot/Configs/autorole"
configs.emotes = require "Hoopsabot/Configs/emotes"
configs.enemies = require "Hoopsabot/Configs/enemies"
configs.users = require "Hoopsabot/Configs/users"
users = {}
configs.colors = {hug= 0xaaffaa, alone = 0x000000, kiss= 0xffaaaa, cry= 0xaaaaff, pins= 0xAAA033, poke= 0x000066, pat= 0xccbbaa}
pscale = 750
dat={} dat.menus = {}
commands = {}
commands.core = {}
commands.core.test = 0x00
commands.core.modulelist = 0x00
commands.core.modenable = 0xfad
commands.core.moddisable = 0xfad
commands.core.setcolor = 0xfad

commands.fun = {}
commands.fun.kiss = 0x11
commands.fun.hug = 0x11
commands.fun.cry = 0x01
commands.fun.guildpower = 0x00
commands.fun.gpscale = 0x00
commands.fun.userpower = 0xf1
commands.fun.pins = 0xf1
commands.fun.dalian = 0x00
commands.fun.rate = 0x10
commands.fun.pair = 0x20

commands.currency = {}
commands.currency.balance = 0x00
commands.currency.heart = 0x10
commands.currency.rep = 0x10
commands.currency.daily = 0x00

commands.debug = {}
commands.debug.emotes = 0x00

commands.admin = {}
commands.admin.censor = 0x1a
commands.admin.censors = 0x00
commands.admin.uncensor = 0x1a
commands.admin.logcensor = 0xd
commands.admin.clear = 0xfda
commands.admin.prefix = 0x1a

client:on("heartbeat", function(shard, inver)
heartbeat = {interval = inver, time = os.time()}
end)

client:on("reactionAdd", function(reaction, uid)
channele = reaction.message.channel
if not client:getUser(uid).bot and reaction.message.embed then if reaction.message.embed.title then
	modulea = string.match(reaction.message.embed.title, "HMenu-(.*)") print(modulea)
	if modulea then
	if reaction.emojiName == "▶" then if modulea == "u-core" then arg = "fun" elseif modulea == "u-fun" then arg = "currency" else arg = "core" end end
	if reaction.emojiName == "◀" then if modulea == "u-core" then arg = "currency" elseif modulea == "u-fun" then arg = "currency" else arg = "core" end end
	if commands[arg] ~= nil then
		cmdlist = ""
		for i, k in pairs(commands[arg]) do
if k == 0x00 then
cmdlist = cmdlist .."**".. i .."** - No Arguments\n"
end
if k == 0xfad then
cmdlist = cmdlist .."**".. i .."** - Owner\n"
end
if k == 0xf1 then
cmdlist = cmdlist .."**".. i .."** - Self & User ID (Single)\n"
end
if k == 0x11 then
cmdlist = cmdlist .."**".. i .."** - Self & Mention (Single)\n"
end
if k == 0x01 then
cmdlist = cmdlist .."**".. i .."** - Self (Single)\n"
end
if k == 0x10 then
cmdlist = cmdlist .."**".. i .."** - Mention (Single)\n"
end
if k == 0x20 then
cmdlist = cmdlist .."**".. i .."** - Mention (Double)\n"
end
if k == 0x1a then
cmdlist = cmdlist .."**".. i .."** - String\n"
end
if k == 0xd then
cmdlist = cmdlist .."**".. i .."** - Channel Mention\n"
end
if k == 0xfda then
cmdlist = cmdlist .."**".. i .."** - Number\n"
end
		end
	end
		if (reaction.emojiName == "▶" or reaction.emojiName == "◀") and reaction.message.author == client.user and string.match(reaction.message.embed.title, "HMenu-(.*)") then
					reaction.message:delete()
			messagee = channele:send({embed = {title = "HMenu-".. arg,color = configs.colors.pins,type = "rich",fields = {{
	name = "Commands : ".. arg,value = cmdlist}}
}}) messagee:addReaction("◀") messagee:addReaction("▶")
		end
end
end

if reaction.message.embed.title == "Profile - Info" then
	local message = reaction.message
	local chan = reaction.message.channel.id
	local user = client:getUser(message.embed.footer.text)
	color = message.guild:getMember(user.id):getColor()
	r,g,b = color:toRGB()
	avg = math.floor((r+g+b)/3)
	colorinv = "0x".. string.format("%x",avg) ..string.format("%x",avg)..string.format("%x",avg)

	if reaction.emojiURL == "https://cdn.discordapp.com/emojis/490563230926635008.png" then
	end

	if reaction.emojiURL == "https://cdn.discordapp.com/emojis/498548692823834627.png" then

		if udata.rpgStats[user.id] then level = udata.rpgStats[user.id].level else level = "Not Loaded" end
			power = 0
		rolep = 0
				for i, k in pairs(message.guild:getMember(user.id).roles) do
					rolep = rolep + 2000
					print(rolep .." role power")
				end
				time = (math.floor((os.time(t) - user.createdAt)/1000)/10)*5
					power = power + time
					power = power + rolep
					if udata.rpgStats[user.id] then levelp = udata.rpgStats[user.id].level*200 else levelp = 0 end
					power = power + levelp
					icon = ""
					if power > pscale*300 then icon = "<:legendary:490572847828434946> " end --legendary
					if power <= pscale*300 then icon = "<:formidible:490572848038150155> " end --formidible
					if power < pscale*160 then icon = "<:powerful2:490572848348397588> " end
					if power < pscale*110 then icon = "<:powerful:490572848218243100> " end --powerful
					if power < pscale*70 then icon = "<:strong2:490572848394534921> " end
					if power < pscale*40 then icon = "<:strong:490572848499523584> " end --strong
					if power < pscale*25 then icon = "<:med2:490572848528883735> " end
					if power < pscale*18 then icon = "<:med:490572848214310915> " end --medium
					if power < pscale*13 then icon = "<:weak2:490572848436477963> " end
					if power < pscale*7 then icon = "<:weak:490572848516169730> " end --weak
					if power == 5132015 then icon = "<:blurple:490586742961864723>" end

						message:delete()

						seen = udata.pref[user.id].firstseen
						if os.time()-seen < 60 then seen = math.floor(os.time()-seen) .." seconds ago" elseif math.floor((os.time()-seen)/60)<60 then seen = math.floor((os.time()-seen)/60) .." minutes ago"
						elseif math.floor((os.time()-seen)/60/60)<24 then seen = math.floor((os.time()-seen)/60/60) .." hours ago" elseif math.floor((os.time()-seen)/60/60/24) <7 then seen=math.floor((os.time()-seen)/60/60/24) .." days ago" else
						seen = math.floor((os.time()-seen)/60/60/24/7) .." weeks ago" end

						messagee = client:getChannel(chan):send({embed = {title = "Profile - Stats", color = tonumber(colorinv),type = "rich",fields = {{
						name = user.username,value = "Level: ".. level .."\nPower: ".. power.."\n\nFirst Seen: ".. seen}}, footer = {icon_url = user.avatarURL, text = user.id}
						}})
	end


end

end
end)

client:on("messageUpdate", function(message)
--if not message.author.bot then client:getGuild("320360694346153994"):getChannel("497929146748502018"):send(message.guild.name .." : ".. message.author.fullname .." : ".. message.content) end
end)
client:on('ready',function()--[[
	for i, k in pairs(users) do
		k = string.format("%.0f", k)
		if udata.rpgStats[k] == nil then
			if io.open("Hoopsabot/Userdata/RPGStats/".. k ..".lua" ,"r") then
				udata.rpgStats[k] = require("Hoopsabot/Userdata/RPGStats/".. k)
			else
				udata.rpgStats[k] = {
					hp=10, points = 0,
					mhp=10,
					level=1,
					xp=0,
					atk=0,
					def=0,
					equipped={name="Fists",atk=1,def=0, range=1}
				}
			end
		end
	end]]
		for i, k in pairs(users) do
			if udata.rpgStats[k] == nil then
				if io.open("Hoopsabot/Userdata/RPGStats/".. k ..".lua" ,"r") then
					udata.rpgStats[k] = require("Hoopsabot/Userdata/RPGStats/".. k)
				else
					udata.rpgStats[k] = {
						hp=10, points = 0,
						mhp=10,
						level=1,
						xp=0,
						atk=0,
						def=0,
						equipped={name="Fists",atk=1,def=0, range=1}
					}
				end
			end
		end
end)

--pins
function pins(message, memberid)
	head = ""
	icon = ""
if memberid == nil then
dt = false
for i, k in pairs(configs.blocks) do for c, v in pairs(configs.blocks[i]) do if c == message.author.id then dt = true end end end
if dt then head = head .. "<:twotone_mood_bad_black_48dp:491789011531202560> **On A Blocked List**\n" else head = head .."<:twotone_mood_black_48dp:491789011342327819> **Good Standing**\n" end
	if client:getGuild("320360694346153994"):getMember(message.author.id) then icon = icon .." <:DevServerMember:491728274473353216> Development Server Member\n" end
	if modules.external.requestOwners(message.author.id, allies) then icon = icon .. "<:ally:491743776390250507> Ally - Top Friend\n" end
	if client:getGuild("457677752921882625"):getMember(message.author.id) then if client:getGuild("457677752921882625"):getMember(message.author.id):hasRole("488561788233973760") then
	 icon = icon .. "<:devvols:491784504835440642> Touhou VoLS Dev\n" end end
 	if client:getGuild("457677752921882625"):getMember(message.author.id) then if client:getGuild("457677752921882625"):getMember(message.author.id):hasRole("4488561787428667393") then
 	 icon = icon .. "<:devvols:491784504835440642> Artist (TH VoLS)\n" end end
 	if client:getGuild("457677752921882625"):getMember(message.author.id) then if client:getGuild("457677752921882625"):getMember(message.author.id):hasRole("488561779262226432") then
 	 icon = icon .. "<:devvols:491784504835440642> Programmer (TH VoLS)\n" end end
 	if client:getGuild("457677752921882625"):getMember(message.author.id) then if client:getGuild("457677752921882625"):getMember(message.author.id):hasRole("488802196289486850") then
 	 icon = icon .. "<:devvols:491784504835440642> Tester (TH VoLS)\n" end end
 	if client:getGuild("477289298685722659"):getMember(message.author.id) then if client:getGuild("477289298685722659"):getMember(message.author.id):hasRole("485584900343201813") then
 	 icon = icon .. "<:noicon:491784504608817152> Artist (smeefcord Role)\n" end end
 	if client:getGuild("482078295307976708"):getMember(message.author.id) then
 	 icon = icon .. "<:lotus:497956296109195284> 2hu Remake Server Member\n" end
	 	--[[if client:getGuild("438364157923033090"):getMember(message.author.id) then if client:getGuild("438364157923033090"):getMember(message.author.id):hasRole("438369649592238083") then
			icon = icon .." 👑 Rogue's Emporium Owner\n" else
			icon = icon .." 🅱 Rogue's Emporium Member\n" end end]]

	if icon == "" then icon = "You have no pins :c" end local messagee = message.channel:send({embed = {color = configs.colors.pins,type = "rich",fields = {{
name = "Your Pins - ".. head,value = icon}}
}})
else
dt = false
for i, k in pairs(configs.blocks) do for c, v in pairs(configs.blocks[i]) do if c == memberid then dt = true end end end
if dt then head = head .. "<:twotone_mood_bad_black_48dp:491789011531202560> **On A Blocked List**\n" else head = head .."<:twotone_mood_black_48dp:491789011342327819> **Good Standing**\n" end
	if client:getGuild("320360694346153994"):getMember(memberid) then icon = icon .." <:DevServerMember:491728274473353216> Development Server Member\n" end
	if modules.external.requestOwners(memberid, allies) then icon = icon .. "<:ally:491743776390250507> Ally - Top Friend\n" end
	if client:getGuild("457677752921882625"):getMember(memberid) then if client:getGuild("457677752921882625"):getMember(memberid):hasRole("488561788233973760") then
	 icon = icon .. "<:devvols:491784504835440642> Touhou VoLS Dev\n" end end
 	if client:getGuild("457677752921882625"):getMember(memberid) then if client:getGuild("457677752921882625"):getMember(memberid):hasRole("488561787428667393") then
 	 icon = icon .. "<:devvols:491784504835440642> Artist - TH VoLS\n" end end
 	if client:getGuild("457677752921882625"):getMember(memberid) then if client:getGuild("457677752921882625"):getMember(memberid):hasRole("488561779262226432") then
 	 icon = icon .. "<:devvols:491784504835440642> Programmer - TH VoLS\n" end end
 	if client:getGuild("457677752921882625"):getMember(memberid) then if client:getGuild("457677752921882625"):getMember(memberid):hasRole("488802196289486850") then
 	 icon = icon .. "<:devvols:491784504835440642> Tester - TH VoLS\n" end end
 	if client:getGuild("477289298685722659"):getMember(memberid) then if client:getGuild("477289298685722659"):getMember(memberid):hasRole("485584900343201813") then
 	 icon = icon .. "<:noicon:491784504608817152> Artist (smeefcord Role)\n" end end
 	if client:getGuild("482078295307976708"):getMember(memberid) then
 	 icon = icon .. "<:lotus:497956296109195284> 2hu Remake Server Member\n" end
	 	if client:getGuild("438364157923033090"):getMember(memberid) then if client:getGuild("438364157923033090"):getMember(memberid):hasRole("438369649592238083") then
			icon = icon .." 👑 Rogue's Emporium Owner\n"  else
			icon = icon .." 🅱 Rogue's Emporium Member\n" end end
	if icon == "" then icon = "This person has no pins :c" end local messagee = message.channel:send({embed = {color = configs.colors.pins,type = "rich",fields = {{
name = message.guild:getMember(memberid).user.username .."'s Pins - ".. head,value = icon}}
}})
end
end

--bot

client:on("memberJoin", function(member)
if configs.blocks[member.guild.id] then if configs.blocks[member.guild.id][member.user.id] == true then
member:addRole(configs.blocks[member.guild.id].role)
else if configs.blocks[member.guild.id].autorole then
member:addRole(configs.blocks[member.guild.id].autorole)
end end end
end)
function loadcur(mem)
if udata.Currencies[mem.id] == nil then
	if io.open("Hoopsabot/Userdata/Currency/".. mem.id ..".lua" ,"r") then
		udata.Currencies[mem.id] = require("Hoopsabot/Userdata/Currency/".. mem.id)
	else
		udata.Currencies[mem.id] = {
			marketCoins = 0,
			reputation = 0,
			coins = 0,
			points = 0,
			heartCoins = 0,
			gems = 0
		}
	end
end
end
client:on("messageCreate", function(message)
	if message.guild then for i, k in pairs(configs.blocks.server) do if k == message.guild.id then message.guild:leave() end end end


	a=false for i, k in pairs(users) do if message.author.id == k then a = true end end
	if not a and table.insert then table.insert(users, tostring(message.author.id)) end
math.randomseed(os.time())
if message.guild then if gdata[message.guild.id] == nil then
	if io.open("Hoopsabot/GuildDat/".. message.guild.id ..".lua" ,"r") then
		gdata[message.guild.id] = require("Hoopsabot/GuildDat/".. message.guild.id)
	else
		gdata[message.guild.id] = {
		}
	end
elseif gdata[message.guild.id].censors then
	for i, k in pairs(gdata[message.guild.id].censors) do
		if string.find(string.lower(message.content), string.lower(i)) and message.author.id ~= client.user.id then
			if gdata[message.guild.id].logcensors then
			client:getChannel(gdata[message.guild.id].logcensors):send({embed = {color = 0xffaaaa,type = "rich",fields = {{
name = "Censored Message",value = message.author.fullname .."(".. message.author.id ..")\n"..message.content}},
thumbnail = {url = message.author.avatarURL}
					}})
				end
			message:delete()
		end
	end
end end
	for i, k in pairs(configs.autoleave) do
		if message.guild.id == i then
			message.guild:leave()
		end
	end
	loadcur(message.author)
if udata.pref[message.author.id] == nil then
	if io.open("Hoopsabot/Userdata/Preferences/".. message.author.id..".lua" ,"r") then
		udata.pref[message.author.id] = require("Hoopsabot/Userdata/Preferences/".. message.author.id)
	else
		udata.pref[message.author.id] = {
			firstseen=os.time()
		}
	end
end
if udata.rpgStats[message.author.id] == nil then
	if io.open("Hoopsabot/Userdata/RPGStats/".. message.author.id..".lua" ,"r") then
		udata.rpgStats[message.author.id] = require("Hoopsabot/Userdata/RPGStats/".. message.author.id)
	else
		udata.rpgStats[message.author.id] = {
			hp=10, points = 0,
			mhp=10,
			level=1,
			xp=0,
			atk=0,
			def=0,
			equipped={name="Fists",atk=1,def=0, range=1}
		}
	end
end
	if udata.pref[message.author.id].firstseen == nil then
		udata.pref[message.author.id].firstseen=os.time()
	end
	if message.author:getPrivateChannel() ~= nil then if message.author:getPrivateChannel().id ~= message.channel.id then
	if gdata[message.guild.id].prefix then prefixcom = gdata[message.guild.id].prefix else prefixcom = "h." end
		if type(udata.Currencies[message.author.id]) ~= "boolean" then udata.Currencies[message.author.id].points = udata.Currencies[message.author.id].points + math.random(1,5 + math.floor(udata.rpgStats[message.author.id].level/5))
		if udata.Currencies[message.author.id].weight then udata.Currencies[message.author.id].points = udata.Currencies[message.author.id].points + math.ceil(udata.Currencies[message.author.id].weight/25) end end
	sendermember = false
	if message.member then

		--for i, k in pairs(message.member.roles) do print(message.member.guild.name .." | ".. k.id .." : ".. k.name) end print()
		--[[if client:getGuild("320360694346153994"):getMember(message.member.user.id) then

			sendermember = true

		end]]
		if message.member.joinedAt then
local year,month,day,hour,minute,second = string.match(message.member.joinedAt, "(%d*)-(%d*)-(%d*)T(%d*):(%d*):(%d*)")
local joinTime = second + (minute*60) + (hour*60*60) + (day*24*60*60) + (month*30.42*24*60*60)--+(year*365*24*60*60)
local joinLength = os.time(t)-joinTime-1512019000
end
	if message.channel.id == "490872952380981248" and string.lower(message.content) == prefixcom .."join" then

		if configs.autorole[message.member.guild.id]["10"] then
			if joinLength then
			if joinLength/60 >= 10 then
message.member:addRole(configs.autorole[message.member.guild.id]["10"])
else
	message.author:send("`"..message.guild.name .."`\n You haven't been here long enough! Wait ".. 10 - math.floor(joinLength/60) .." more minutes.")  message.author:getPrivateChannel():close()
end
end
end
	end
end
	math.randomseed(os.time())
	local cmd, arg = string.match(string.lower(message.content), '(%S+) (.*)')
  --modules.external:singlesend(":ballot_box_with_check: Bot Loaded! (Version ".. metas.Version ..")", message)
  --modules.external:send("<:redmark:490331379834552320> Hello ".. message.author.username, message, configs.ignore.user)
	  if modules.toggle.core == true then -- Core Module Message Respond Command

			if string.lower(message.content) == prefixcom .."levelnotify" then
				if udata.pref[message.author.id].levelnotify == true then
					udata.pref[message.author.id].levelnotify = false
					message.channel:send("Level Notifications Disabled")
				else
					udata.pref[message.author.id].levelnotify = true
					message.channel:send("Level Notifications Enabled")
				end
			end
			if cmd == "d.delete" and modules.external.requestOwners(message.author.fullname, owners) == true then
				if message.channel:getMessage(arg) then
					message.channel:getMessage(arg):delete()
				end
			end
			if string.lower(message.content) == "d.activity" then
				if message.member.activity then
					act = message.member.activity
					message = ""
					if 	act.imageLarge then message = message .."\nThere is a Large Image" end
					if act.textLarge then message = message .." with the text ".. act.textLarge end
					if 	act.imageSmall then message = message .."\nThere is a Small Image" end
					if act.textSmall then message = message .." with the text ".. act.textSmall end
					if act.details then message = message .."\nThe details for this presence are ".. act.details end
					message.channel:send(message.author.username .." (you) is playing ".. act.name ..message)
				else
					message.channel:send("you have no presence right now :c")
				end
			end
			if string.lower(message.content) == "d.stats" then
				cc = 0
				for i, k in pairs(client.guilds) do
					print(k.name)
					cc = cc + #k.textChannels
				end
				if client.verified then verify = "verified email." else verify = "unverified email." end
				if client.shardCount then shcount = client.shardCount shtotal = client.totalShardCount else shcount = "?" shtotal = "?" end
				message.channel:send("I am in ".. #client.guilds .." servers (guilds).\n".. "I am in ".. #client.privateChannels .." private channels (DMs) and ".. cc .." text channels (guilds).\n"..
			"I have ".. #client.users .." users right now. \nMy owner is <@".. client.owner.id ..">\n".. math.ceil(gcinfo()/1000*10)/10
			 .."MB (".. gcinfo() .." KB) being used. - I am managing ".. shcount+1 .." / ".. shtotal .." shards.")
			end
			if string.lower(message.content) == prefixcom .."heartbeat" then
				a = message.channel:send(":heart:") a:setContent(tostring(heart))
				end
	    if string.lower(message.content) == prefixcom .."test" then
	    modules.external:send("<:redmark:490331379834552320> Bot Functional", message, configs.ignore.user)
	    end
	    if string.lower(message.content) == prefixcom .."modulelist" then
				aa = ""
				for i, k in pairs(modules.toggle) do
					aa = aa ..i ..": "
					if k == true then aa = aa .."Enabled\n"else aa = aa .."Disabled\n" end
				end
	      message.channel:send("Bot Modules:\n".. aa)
	    end
			if cmd == prefixcom .."rep" and #message.mentionedUsers ==1 then
				if udata.pref[message.author.id].repTime == nil then
					for i, k in pairs(message.mentionedUsers) do if message.author.id ~= k.id then
						udata.pref[message.author.id].repTime = os.time(t)
						loadcur(k)
					udata.Currencies[k.id].reputation = udata.Currencies[k.id].reputation+ 1
						message.channel:send("<:Reputation:494912754654642177>".. message.author.fullname .." gave ".. k.fullname .." a Reputation Point!")
					break
				end end
				elseif os.time(t) >= udata.pref[message.author.id].repTime + (60*60*24) then
					for i, k in pairs(message.mentionedUsers) do if message.author.id ~= k.id then
						udata.pref[message.author.id].repTime = os.time(t)
						loadcur(k)
					udata.Currencies[k.id].reputation = udata.Currencies[k.id].reputation+ 1
						message.channel:send("<:Reputation:494912754654642177>".. message.author.fullname .." gave ".. k.fullname .." a Reputation Point!")
					break
				end end
				else
					h = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t))/60/60)
					m = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t))/60)-h*60
					s = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t)))-h*60*60-m*60
					message.channel:send("You need to wait".. h .."h:".. m .."m:".. s .."s longer!")
			end
			end
			if string.lower(message.content) == prefixcom .."rep" and udata.pref[message.author.id].repTime then

				if os.time(t) >= udata.pref[message.author.id].repTime + (60*60*24) then
				message.channel:send("You can give a rep!")
				else
					h = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t))/60/60)
					m = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t))/60)-h*60
					s = math.floor(math.abs((udata.pref[message.author.id].repTime + (60*60*24))-os.time(t)))-h*60*60-m*60
					message.channel:send("You need to wait".. h .."h:".. m .."m:".. s .."s longer!")
				end
			elseif string.lower(message.content) == prefixcom .."rep" then
			message.channel:send("You can give a rep!")
			end
			if string.lower(message.content) == prefixcom .."daily"then
				if udata.pref[message.author.id].dailyTime == nil then
						udata.pref[message.author.id].dailyTime = os.time(t)
						loadcur(message.author)
					udata.Currencies[message.author.id].marketCoins = udata.Currencies[message.author.id].marketCoins+ 150
						message.channel:send("<:Market_Coin:494912753278910474>You earned your daily 150 Market Coins!")
				elseif os.time(t) >= udata.pref[message.author.id].dailyTime + (60*60*24) then
						udata.pref[message.author.id].dailyTime = os.time(t)
						loadcur(message.author)
					udata.Currencies[message.author.id].marketCoins = udata.Currencies[message.author.id].marketCoins+ 150
						message.channel:send("<:Market_Coin:494912753278910474>You earned your daily 150 Market Coins!")
				else
					h = math.floor(math.abs((udata.pref[message.author.id].dailyTime + (60*60*24))-os.time(t))/60/60)
					m = math.floor(math.abs((udata.pref[message.author.id].dailyTime + (60*60*24))-os.time(t))/60)-h*60
					s = math.floor(math.abs((udata.pref[message.author.id].dailyTime + (60*60*24))-os.time(t)))-h*60*60-m*60
					message.channel:send("You need to wait".. h .."h:".. m .."m:".. s .."s longer!")
			end
		end



		if cmd == prefixcom .."heart" and #message.mentionedUsers ==1 then
				for i, k in pairs(message.mentionedUsers) do if message.author.id ~= k.id then
					loadcur(k)
				udata.Currencies[k.id].heartCoins = udata.Currencies[k.id].heartCoins+ 1
					message.channel:send("<:Love_Coin:494912754726207488>".. message.author.fullname .." gave ".. k.fullname .." a Love Coin!")
				break
			end end
		end

			if cmd == prefixcom .."react" and modules.external.requestOwners(message.author.fullname, owners) == true then
	local arga, argb, argc, argd = string.match(arg, '(%S+) (.-) (.-) (.*)')
	print(arga)
	print(argb)
	print(argc)
	print(argd)
	if arga then
	client:getGuild(arga):getChannel(argb):getMessage(argc):addReaction(argd)
	end
			end
	    if cmd == prefixcom .."modenable" and modules.external.requestOwners(message.author.fullname, owners) == true then
	      if modules.toggle[arg] ~= nil and arg ~= "core" then
	        modules.toggle[arg] = true
	    modules.external:send(":ballot_box_with_check: `".. arg .."` Module Enabled", message, configs.ignore.user)
	  end
	    end
	    if cmd == prefixcom .."moddisable" and modules.external.requestOwners(message.author.fullname, owners) == true then
	      if modules.toggle[arg] ~= nil and arg ~= "core" then
	        modules.toggle[arg] = false
	    modules.external:send(":ballot_box_with_check: `".. arg .."` Module Disabled", message, configs.ignore.user)
	  end
	    end

    if cmd == prefixcom .."setcolor" and modules.external.requestOwners(message.author.fullname, owners) == true then
			local arga, argb = string.match(arg, '(%S+) (.*)')
			if argb then
			if configs.colors[arga] ~= nil then configs.colors[arga] = tonumber("0x"..argb)
						local message = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "Example",value = "_ _"}}
					}}) end
		end
    end

		if string.lower(message.content) == "is malachi the cutest thing in existence?" or string.lower(message.content) == "is malachi the cutest thing in existence" then
			message.channel:send("absolutely completely 100% the cutest thing ever!")
		end

		if cmd == prefixcom .."delete" and modules.external.requestOwners(message.author.fullname, owners) == true then
			msg = ""
			for i, k in pairs(message.mentionedUsers) do
				os.remove("Hoopsabot/Userdata/Currency/".. k.id ..".lua")
					os.remove("Hoopsabot/Userdata/RPGStats/".. k.id ..".lua")
						os.remove("Hoopsabot/Userdata/Preferences/".. k.id ..".lua")
				msg = msg .. ", ".. k.username
			end
			message.channel:send("Deleted ".. msg)
		end

		if message.content == prefixcom .."commands" then arg = "core"
			if arg then
			if commands[arg] ~= nil then
				cmdlist = ""
				for i, k in pairs(commands[arg]) do
		if k == 0x00 then
		cmdlist = cmdlist .."**".. i .."** - No Arguments\n"
		end
		if k == 0xfad then
		cmdlist = cmdlist .."**".. i .."** - Owner\n"
		end
		if k == 0xf1 then
		cmdlist = cmdlist .."**".. i .."** - Self & User ID (Single)\n"
		end
		if k == 0x11 then
		cmdlist = cmdlist .."**".. i .."** - Self & Mention (Single)\n"
		end
		if k == 0x01 then
		cmdlist = cmdlist .."**".. i .."** - Self (Single)\n"
		end
		if k == 0x10 then
		cmdlist = cmdlist .."**".. i .."** - Mention (Single)\n"
		end
		if k == 0x1a then
		cmdlist = cmdlist .."**".. i .."** - String\n"
		end
if k == 0xd then
cmdlist = cmdlist .."**".. i .."** - Channel Mention\n"
end
if k == 0xfda then
cmdlist = cmdlist .."**".. i .."** - Number\n"
end
				end
		messagee = message.channel:send({embed = {title = "HMenu-".. arg,color = configs.colors.pins,type = "rich",fields = {{
name = "Commands : ".. arg,value = cmdlist}}
					}}) messagee:addReaction("▶") end
		end
    end
  end
  if modules.toggle.fun == true then
		if cmd == prefixcom .."hug" or  string.lower(message.content) == prefixcom .."hug" then
			for i, k in pairs(message.mentionedUsers) do mentioned = k end

if mentioned then if mentioned.fullname ~= message.author.fullname then
						local message = message.channel:send({embed = {color = configs.colors.hug,type = "rich",fields = {{
name = "Hey ".. mentioned.username ..", ".. message.author.username .." hugged you!",value = "_ _"}},
							thumbnail = {
							url=configs.images.hug[math.random(1,#configs.images.hug)],
							height=150,width=150
						}
					}})
						message:addReaction("Emoji: 490563230926635008") else local message = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "Oh no...",value = "_ _"}},
							thumbnail = {
							url=configs.images.hugalone[math.random(1,#configs.images.hugalone)],
							height=150,width=150
						}
					}})
end
else local message = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "Oh no...",value = "_ _"}},
	thumbnail = {
	url=configs.images.hugalone[math.random(1,#configs.images.hugalone)],
	height=150,width=150
}
}})
end

		end
		if message.guild.id == "329292126708039690" or message.guild.id == "388547855289417730" then
			if not udata.Currencies[message.author.id].EatBonus then
				udata.Currencies[message.author.id].EatBonus = 0
			end
			if udata.Currencies[message.author.id].weight and message.guild.id == "329292126708039690" then

								if udata.Currencies[message.author.id].weight >=200 then
									message.member:addRole("507730323379847181")
								end
												if udata.Currencies[message.author.id].weight >=450 then
													message.member:addRole("507730426324844544")
												end
																if udata.Currencies[message.author.id].weight >=800 then
																	message.member:addRole("507730508353110016")
																end
																				if udata.Currencies[message.author.id].weight >=1250 then
																					message.member:addRole("507730551390863371")
																				end
																								if udata.Currencies[message.author.id].weight >=2000 then
																									message.member:addRole("507730654050516993")
																								end
																												if udata.Currencies[message.author.id].weight >=10000 then
																													message.member:addRole("507730809487228928")
																												end
																																if udata.Currencies[message.author.id].weight >=100000 then
																																	message.member:addRole("507730871814455307")
																																end
																																				if udata.Currencies[message.author.id].weight >=1000000 then
																																					message.member:addRole("507730913493385216")
																																				end
																																								if udata.Currencies[message.author.id].weight >=10000000 then
																																									message.member:addRole("507733894871908363")
																																								end

			end
			if message.content == prefixcom .. "eat" then
				if udata.Currencies[message.author.id].weight then
					weigh = (math.random(1, 5)/5)*(udata.Currencies[message.author.id].EatBonus+1)
					udata.Currencies[message.author.id].weight = udata.Currencies[message.author.id].weight + weigh
					message.channel:send("You ate some food and gained ".. weigh .." pounds!")
				else
					weigh = (math.random(1, 5)/5)*(udata.Currencies[message.author.id].EatBonus+1)
					udata.Currencies[message.author.id].weight = 136
					udata.Currencies[message.author.id].weight = udata.Currencies[message.author.id].weight + weigh
					message.channel:send("You ate your first food and gained ".. weigh .." pounds!")
				end
			end
			if message.content == prefixcom .. "eatup" then
				price = (udata.Currencies[message.author.id].EatBonus+1)*5
				if udata.Currencies[message.author.id].coins >= price then
					udata.Currencies[message.author.id].coins = udata.Currencies[message.author.id].coins - price
					udata.Currencies[message.author.id].EatBonus = udata.Currencies[message.author.id].EatBonus + 1
					message.channel:send("You upgraded your food/cmd to ".. udata.Currencies[message.author.id].EatBonus+1 .."!")
				else
					message.channel:send("Insufficient funds!")
				end
			end
			if message.content == prefixcom .. "euppr" then
				message.channel:send("An Upgrade for you costs ".. (udata.Currencies[message.author.id].EatBonus+1)*5 .." credits!")
			end
			if message.content == prefixcom .."weigh" then
				if udata.Currencies[message.author.id].weight then
					message.channel:send("You weigh ".. udata.Currencies[message.author.id].weight .." pounds!")
				else
					udata.Currencies[message.author.id].weight = 136
					message.channel:send("You weigh ".. udata.Currencies[message.author.id].weight .." pounds!")
				end
			end
		end
		if cmd == prefixcom .."rate" then
			mentioned = message.mentionedUsers.first.id
			if mentioned then
			math.randomseed(tonumber(mentioned)*2)
			if mentioned == "157557940872544256" or mentioned == "409532509823696906" or mentioned == "242336795197440000" then
			message.channel:send("100% cute!")
		else
			message.channel:send(math.random(0,100) .."% cute!")
		end
			math.randomseed(os.time(t))
		end
		end
		if cmd == prefixcom .."pair" then
			mentioned = message.mentionedUsers.first.id
				mentionedl = message.mentionedUsers.last.id
				if mentioned and mentionedl then
			math.randomseed(tonumber(mentioned)+mentionedl)
			num = math.random(0,100) if (mentioned == "157557940872544256" or mentionedl == "157557940872544256") and (mentioned == "115529446370443265" or mentionedl == "115529446370443265") then num = 100 end
			if  num>0 then str = "Poor" end
			if num>20 then str = "Dangerous" end
			if num>30 then str = "Low" end
			if num>50 then str = "Moderate" end
			if num>70 then str = "Above Average" end
			if num>80 then str = "High" end
			if num>90 then str = "Very High" end
			if num>=100 then str = "Absolute" end
			str = str .."\nNote: These numbers aren't concrete! You can make things better!"
			message.channel:send(num .."% Rating\n"..str)
			math.randomseed(os.time(t)) end
		end

							if string.lower(message.content) == prefixcom .."age" then message.channel:send(tostring((os.time(t) - message.author.createdAt)/60/60/24)) end
							if cmd == prefixcom .."age" and message.guild:getMember(arg) then message.channel:send(tostring((os.time(t) - message.guild:getMember(arg).user.createdAt)/60/60/24)) end
							if cmd == prefixcom .."bean" then

														local message = message.channel:send({embed = {color = 0xaa00aa,type = "rich",fields = {{
								name = "_ _",value = "get beaned"}},
															thumbnail = {
															url="https://media.discordapp.net/attachments/498577191903297556/499046888050262016/beancream.png?width=400&height=300",
															height=200,width=200
														}
													}})
												end
					if string.lower(message.content) == prefixcom .."dalian" or cmd == prefixcom .."dalian" then

												local message = message.channel:send({embed = {color = 0xaa00aa,type = "rich",fields = {{
						name = "_ _",value = "_ _"}},
													thumbnail = {
													url=configs.images.dalian[math.random(1,#configs.images.dalian)],
													height=200,width=200
												}
											}})
										end
					if cmd == prefixcom .."kiss" or  string.lower(message.content) == prefixcom .."kiss" then
						mentioned = nil
						for i, k in pairs(message.mentionedUsers) do mentioned = k end

			if mentioned then if mentioned.fullname ~= message.author.fullname then
									local message = message.channel:send({embed = {color = configs.colors.kiss,type = "rich",fields = {{
			name = "Hey ".. mentioned.username ..", ".. message.author.username .." kissed you!",value = "_ _"}},
										thumbnail = {
										url=configs.images.kiss[math.random(1,#configs.images.kiss)],
										height=150,width=150
									}
								}})
									message:addReaction("Emoji: 490535794948177920") else local message = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
			name = "Oh no...",value = "_ _"}},
										thumbnail = {
										url=configs.images.kissalone[math.random(1,#configs.images.kissalone)],
										height=150,width=150
									}
								}})
			end
		else local message = message.channel:send({embed = {color = configs.colors.kiss,type = "rich",fields = {{
			name = "Everyone gets a kiss!",value = "_ _"}},
				thumbnail = {
				url=configs.images.kissalone[math.random(1,#configs.images.kissalone)],
				height=150,width=150
			}
			}})
			end

					end
if cmd == prefixcom .."poke" or  string.lower(message.content) == prefixcom .."poke" then
	mentioned = nil
	for i, k in pairs(message.mentionedUsers) do mentioned = k end

if mentioned then if mentioned.fullname ~= message.author.fullname then
				local message = message.channel:send({embed = {color = configs.colors.poke,type = "rich",fields = {{
name = message.author.username .." just poked you, ".. mentioned.username .."!",value = "_ _"}},
					thumbnail = {
					url=configs.images.poke[math.random(1,#configs.images.poke)],
					height=150,width=150
				}
			}}) else local message = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "poke",value = "_ _"}},
					thumbnail = {
					url=configs.images.poke[math.random(1,#configs.images.poke)],
					height=150,width=150
				}
			}})
end
else local message = message.channel:send({embed = {color = configs.colors.poke,type = "rich",fields = {{
name = "poke",value = "_ _"}},
thumbnail = {
url=configs.images.poke[math.random(1,#configs.images.poke)],
height=150,width=150
}
}})
end

end
if cmd == prefixcom .."pat" or  string.lower(message.content) == prefixcom .."pat" then
mentioned = nil
for i, k in pairs(message.mentionedUsers) do mentioned = k end

if mentioned then if mentioned.fullname ~= message.author.fullname then
local message = message.channel:send({embed = {color = configs.colors.pat,type = "rich",fields = {{
name = message.author.username .." just patted you, ".. mentioned.username .."!",value = "_ _"}},
thumbnail = {
url=configs.images.pat[math.random(1,#configs.images.pat)],
height=10,width=150
}
}}) else local message = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "pat",value = "_ _"}},
thumbnail = {
url=configs.images.pat[math.random(1,#configs.images.pat)],
height=150,width=150
}
}})
end
else local message = message.channel:send({embed = {color = configs.colors.pat,type = "rich",fields = {{
name = "pat",value = "_ _"}},
thumbnail = {
url=configs.images.pat[math.random(1,#configs.images.pat)],
height=150,width=150
}
}})
end

end


if cmd == prefixcom .."cry" or  string.lower(message.content) == prefixcom .."cry" then

				local message = message.channel:send({embed = {color = configs.colors.cry,type = "rich",fields = {{
name = "Please don't cry...",value = "_ _"}},
					thumbnail = {
					url=configs.images.cry[math.random(1,#configs.images.cry)],
					height=150,width=150
				}
			}})
				message:addReaction("Emoji: 490559799071735828")
			end
			if cmd == prefixcom .."bunny" or  string.lower(message.content) == prefixcom .."bunny" then

							local message = message.channel:send({embed = {color = 0x8888FF,type = "rich",fields = {{
	name = "Cute bun",value = "_ _"}},
								thumbnail = {
								url=configs.images.bunny[math.random(1,#configs.images.bunny)],
								height=150,width=150
							}
						}})
						end

			if string.lower(message.content) == prefixcom .."gpscale" then
		local message = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "Guild Power Scale",value =
"<:weak:490572848516169730>Weak (".. 0 .." Points)\n"..
"<:weak2:490572848436477963>Weak2 (".. pscale*7 .." Points)\n"..
"<:med:490572848214310915>Medium (".. pscale*13 .." Points)\n"..
"<:med2:490572848528883735>Medium2 (".. pscale*18 .." Points)\n"..
"<:strong:490572848499523584>Strong (".. pscale*25 .." Points)\n"..
"<:strong2:490572848394534921>Strong2 (".. pscale*40 .." Points)\n"..
"<:powerful:490572848218243100>Powerful (".. pscale*70 .." Points)\n"..
"<:powerful2:490572848348397588>Powerful2 (".. pscale*110 .." Points)\n"..
"<:formidible:490572848038150155>Formidible (".. pscale*160 .." Points)\n"..
"<:legendary:490572847828434946>Legendary (>".. pscale*300 .." Points)\n"..
hide(modules.external.requestOwners(message.author.fullname, owners) == true, "<:blurple:490586742961864723>Blurple (Exactly 5132015 Points) -- Secret (This line only appears for Owners)\n", "")}}
}})
			end

			if string.lower(message.content) == prefixcom .."guildpower" then
				power = 0
				local messageecalc = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "Guild Power",value = "Gathering Data, Please Wait..."}}
			}})
			memberp = 0
			rolep = 0
				for i, k in pairs(message.guild.members) do
					memberp = memberp + 200
					print(memberp .." member power")
				end
					for i, k in pairs(message.guild.roles) do
						rolep = rolep + 40
						print(rolep .." role power")
					end
					time = (math.floor((os.time(t) - message.guild.createdAt)/5000)/10)*10
						power = power + time
						power = power + memberp
						power = power + rolep
						icon = ""
						if power > pscale*300 then icon = "<:legendary:490572847828434946> " end --legendary
						if power <= pscale*300 then icon = "<:formidible:490572848038150155> " end --formidible
						if power < pscale*160 then icon = "<:powerful2:490572848348397588> " end
						if power < pscale*110 then icon = "<:powerful:490572848218243100> " end --powerful
						if power < pscale*70 then icon = "<:strong2:490572848394534921> " end
						if power < pscale*40 then icon = "<:strong:490572848499523584> " end --strong
						if power < pscale*25 then icon = "<:med2:490572848528883735> " end
						if power < pscale*18 then icon = "<:med:490572848214310915> " end --medium
						if power < pscale*13 then icon = "<:weak2:490572848436477963> " end
						if power < pscale*7 then icon = "<:weak:490572848516169730> " end --weak
						if power == 5132015 then icon = "<:blurple:490586742961864723>" end
						if power-10000>0 then power = tostring(math.floor(power/1000) .."k") end
						messageecalc:delete()
					local messagee = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "Guild Power",value = icon .."This Guild (".. message.guild.name ..")'s Power is ".. power .."!\nTime: "..time .." Points\nMembers: ".. memberp .." Points\nRoles: ".. rolep .." Points"}}
			}})
		end

		if string.lower(message.content) == prefixcom .."userpower" then
			power = 0
			local messageecalc = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "User Power",value = "Gathering Data, Please Wait..."}}
		}})
		rolep = 0
				for i, k in pairs(message.member.roles) do
					rolep = rolep + 2000
					print(rolep .." role power")
				end
				time = (math.floor((os.time(t) - message.author.createdAt)/1000)/10)*5
					power = power + time
					power = power + rolep
					if udata.rpgStats[message.author.id] then levelp = udata.rpgStats[message.author.id].level*200 else levelp = 0 end
					power = power + levelp
					icon = ""
					if power > pscale*300 then icon = "<:legendary:490572847828434946> " end --legendary
					if power <= pscale*300 then icon = "<:formidible:490572848038150155> " end --formidible
					if power < pscale*160 then icon = "<:powerful2:490572848348397588> " end
					if power < pscale*110 then icon = "<:powerful:490572848218243100> " end --powerful
					if power < pscale*70 then icon = "<:strong2:490572848394534921> " end
					if power < pscale*40 then icon = "<:strong:490572848499523584> " end --strong
					if power < pscale*25 then icon = "<:med2:490572848528883735> " end
					if power < pscale*18 then icon = "<:med:490572848214310915> " end --medium
					if power < pscale*13 then icon = "<:weak2:490572848436477963> " end
					if power < pscale*7 then icon = "<:weak:490572848516169730> " end --weak
					if power == 5132015 then icon = "<:blurple:490586742961864723>" end
					if power-10000>0 then power = tostring(math.floor(power/1000) .."k") end
					messageecalc:delete()
				local messagee = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "User Power",value = icon .."Your Power is ".. power .."!\nTime: "..time .." Points\nRoles: ".. rolep .." Points\nLevels: ".. levelp .." Power"}}
		}})
	end
	if string.lower(message.content) == prefixcom .."reload" and modules.external.requestOwners(message.author.fullname, owners) == true then
		msg = ""
		for i, k in pairs(package.loaded) do
			if string.match(i, "Hoopsabot/Configs/") then
			local a = string.match(i, "Hoopsabot/Configs/(.*)")
			package.loaded[i] = nil
			configs[a] = require(i)
			msg = msg .."reloaded `".. i.."`\n"
		end
		end
		package.loaded["Hoopsabot/Configs/blocks"] = nil
		configs.blocks = nil
		configs.blocks = require "Hoopsabot/Configs/blocks"
		message.author:send(msg) message.author:getPrivateChannel():close()
		message:delete()
	end
	if cmd == prefixcom .."userpower" then
		for i, k in pairs(message.guild.members) do
				if k.username == arg or k.fullname == arg then
					arg = k.user.id
				end
				if k.user.id == arg then arg = k.user.id end
			end
		if type(message.guild:getMember(arg)) == "table" then
		power = 0
		local messageecalc = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
name = "User Power",value = "Gathering Data, Please Wait..."}}
	}})
	rolep = 0
			for i, k in pairs(message.guild:getMember(arg).roles) do
				rolep = rolep + 2000
				print(rolep .." role power")
			end
			time = (math.floor((os.time(t) - client:getUser(arg).createdAt)/1000)/10)*5
				power = power + time
				power = power + rolep
				if udata.rpgStats[arg] then levelp = udata.rpgStats[arg].level*200 else levelp = 0 end
				power = power + levelp
				icon = ""
				if power > pscale*300 then icon = "<:legendary:490572847828434946> " end --legendary
				if power <= pscale*300 then icon = "<:formidible:490572848038150155> " end --formidible
				if power < pscale*160 then icon = "<:powerful2:490572848348397588> " end
				if power < pscale*110 then icon = "<:powerful:490572848218243100> " end --powerful
				if power < pscale*70 then icon = "<:strong2:490572848394534921> " end
				if power < pscale*40 then icon = "<:strong:490572848499523584> " end --strong
				if power < pscale*25 then icon = "<:med2:490572848528883735> " end
				if power < pscale*18 then icon = "<:med:490572848214310915> " end --medium
				if power < pscale*13 then icon = "<:weak2:490572848436477963> " end
				if power < pscale*7 then icon = "<:weak:490572848516169730> " end --weak
				if power == 5132015 then icon = "<:blurple:490586742961864723>" end
				if power-10000>0 then power = tostring(math.floor(power/1000) .."k") end
				messageecalc:delete()

				local messagee = message.channel:send({embed = {color = configs.colors[arga],type = "rich",fields = {{
	name = "User Power",value = icon .. client:getUser(arg).username .."'s Power is ".. power .."!\nTime: "..time .." Points\nRoles: ".. rolep .." Points\nLevels: ".. levelp .." Points"}}
		}})
end end

	if cmd == prefixcom .."pins" then
		for i, k in pairs(message.guild.members) do
			if k.username == arg or k.fullname == arg then
				pins(message,k.user.id)
				return
			end
		end
		if message.guild:getMember(arg) then
		pins(message,arg)
	end
	end
	if string.lower(message.content) == prefixcom .."pins" then
		pins(message)
	end
	if cmd == prefixcom .."assign" and message.member == message.guild.owner then
		match = "" err = nil
		if not tonumber(arg) then for i, k in pairs(message.guild.roles) do
			if string.match(k.name, arg) and match == "" then match = k.id elseif match == "" then err = "No matching roles" else err = "Multiple matching roles" print(k.name) end
		end else match = arg end
		if err and match == "" then message.channel:send("Error! ".. err) else if message.guild:getRole(arg) then for i,k in pairs(message.guild.members) do k:addRole(match) end else
		for i,k in pairs(message.guild.members) do k:addRole(match) end end
		end
	end
		if string.lower(message.content) == prefixcom .."rpgstats" then
			hp = ""
			for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
				if udata.rpgStats[message.author.id].hp-i>=0 and i%10 == 0 then
					hp = hp .. "🔶"
				elseif i%10 == 0 then
					hp = hp .. "▪"
				end
			end
			hp = hp .." ( "..udata.rpgStats[message.author.id].hp .." / ".. udata.rpgStats[message.author.id].mhp .." ) \n"
				xp = ""
				for i = 1, 10 do
					if (udata.rpgStats[message.author.id].xp/(udata.rpgStats[message.author.id].level*15))-(i/10)>=0 then
						xp = xp .. "🔷"
					else
						xp = xp .. "▪"
					end
				end
				xp = xp .." ( "..udata.rpgStats[message.author.id].xp .." / ".. udata.rpgStats[message.author.id].level*15 .." ) "


			 local messagee = message.author:send({embed = {color = configs.colors.kiss,type = "rich",fields = {{
			name = "RPG Stats",value = "Level ".. udata.rpgStats[message.author.id].level .." - ".. udata.rpgStats[message.author.id].points .." Points to Spend\n\nHP: ".. hp .."XP: ".. xp
		.. "\nYour Stats: ATK ".. udata.rpgStats[message.author.id].atk .." | DEF ".. udata.rpgStats[message.author.id].def .."\n\nEquipped: \n"..udata.rpgStats[message.author.id].equipped.name .."\nATK: "..udata.rpgStats[message.author.id].equipped.atk .." | DEF: ".. udata.rpgStats[message.author.id].equipped.def
	.. " | Range: ".. udata.rpgStats[message.author.id].equipped.range .." Tiles"}}
			}})  message.author:getPrivateChannel():close()
		end




  end
	madmin = false
	if message.member then
for i, k in pairs(message.member.roles) do
	for l,v in pairs(k:getPermissions():toTable()) do
		if l == "administrator" and v == true then madmin = true end
	end
	if k.name == "h:admin" then madmin = true end
	if message.author == message.guild.owner then madmin = true end
end end
if madmin == true then
	if cmd == "h@clear" and tonumber(arg) then
for i = 1, tonumber(arg) do
	message.channel:getLastMessage():delete()
end
	end

	if cmd == "h@prefix" then
		gdata[message.guild.id].prefix = arg
		message.channel:send("The new prefix is ".. arg .."  !")
	end

	if message.content == "h@commands" then arg = "admin"
		if arg then
		if commands[arg] ~= nil then
			cmdlist = ""
			for i, k in pairs(commands[arg]) do
	if k == 0x00 then
	cmdlist = cmdlist .."**".. i .."** - No Arguments\n"
	end
	if k == 0xfad then
	cmdlist = cmdlist .."**".. i .."** - Owner\n"
	end
	if k == 0xf1 then
	cmdlist = cmdlist .."**".. i .."** - Self & User ID (Single)\n"
	end
	if k == 0x11 then
	cmdlist = cmdlist .."**".. i .."** - Self & Mention (Single)\n"
	end
	if k == 0x01 then
	cmdlist = cmdlist .."**".. i .."** - Self (Single)\n"
	end
	if k == 0x10 then
	cmdlist = cmdlist .."**".. i .."** - Mention (Single)\n"
	end
	if k == 0x1a then
	cmdlist = cmdlist .."**".. i .."** - String\n"
	end
if k == 0xd then
cmdlist = cmdlist .."**".. i .."** - Channel Mention\n"
end
if k == 0xfda then
cmdlist = cmdlist .."**".. i .."** - Number\n"
end
			end
				local messagee = message.channel:send({embed = {color = 0x9999aa,type = "rich",fields = {{
			name = "_ _",value = cmdlist}},
			author = {icon_url = "https://cdn.discordapp.com/attachments/489743530231857162/498585465121669148/Wrench.png",name="H@Admin Commands",}
			}}) end
	end
	end

	if cmd == "h@logcensor" then
		if client:getChannel(arg) then
			if message.guild:getChannel(arg) then
				gdata[message.guild.id].logcensors = arg
				message.channel:send("I will now send censor logs to ".. client:getChannel(gdata[message.guild.id].logcensors).name)
			end
		end
		if message.mentionedChannels then
					gdata[message.guild.id].logcensors = message.mentionedChannels.first.id
					message.channel:send("I will now send censor logs to ".. client:getChannel(gdata[message.guild.id].logcensors).name)
			end
	end
	if message.content == "h@logcensor" then gdata[message.guild.id].logcensors = nil
	message.channel:send("I will no longer send censor logs.") end
			if cmd == "h@censor" then
				if not gdata[message.guild.id].censors then gdata[message.guild.id].censors = {} end
				message.channel:send("I will now delete messages containing ".. arg )
				gdata[message.guild.id].censors[arg] = true
			end
					if cmd == "h@uncensor" then
						if not gdata[message.guild.id].censors then gdata[message.guild.id].censors = {} end
					if gdata[message.guild.id].censors[arg] == true then gdata[message.guild.id].censors[arg] = nil
						message.channel:send("I will now not delete messages containing ".. arg )
					else message.channel:send("That censor does not exist") end
					end
			if string.lower(message.content) == "h@censors" then
				if not gdata[message.guild.id].censors then gdata[message.guild.id].censors = {} end str = "Censors: \n"
				for i, k in pairs(gdata[message.guild.id].censors) do
					str = str .. i .."\n"
				end if str == "Censors: \n" then str = "Blank" end
				message.author:send(str)
			end end

if modules.toggle.debug then


	if string.lower(message.content) == "d.emotes" then
		aa = ""
		str = ""
		for i, k in pairs(message.guild.emojis) do
			if not k.animated then
			aa = aa.."<:"..k.name ..":".. k.id .."> Name: ".. k.name .." | ID: ".. k.id .."\n"
		else
		aa = aa.."<a:"..k.name ..":".. k.id .."> Name: ".. k.name .." | ID: ".. k.id .." | Animated\n"
		end
			if string.len(aa) > 2000 then
			message.channel:send(str)
			str = ""
			if not k.animated then
				aa = "<:"..k.name ..":".. k.id .."> Name: ".. k.name .." | ID: ".. k.id .."\n"
			else
			aa = "<a:"..k.name ..":".. k.id .."> Name: ".. k.name .." | ID: ".. k.id .." | Animated\n"
			end
				str = aa
			else
				str = aa
			end
		end
		message.channel:send(aa)
	end
	if cmd then

	if string.lower(cmd) == prefixcom .."profile" then
		user = message.mentionedUsers.first
	local year,month,day,hour,minute,second = string.match(user.timestamp, "(%d*)-(%d*)-(%d*)T(%d*):(%d*):(%d*)")
	date = month.."/".. day .."/".. year ..' (M/D/Y)'
	local year,month,day,hour,minute,second = string.match(message.guild:getMember(user.id).joinedAt, "(%d*)-(%d*)-(%d*)T(%d*):(%d*):(%d*)")
	dateg = month.."/".. day .."/".. year ..' (M/D/Y)'
		aa = string.match(message.guild:getMember(user.id):getColor():toHex(), "#(.*)")
		st=message.guild:getMember(user.id).status
		if st == "online" then
			statusico = "<:online:498576666856128559>" elseif st == "idle" then
				statusico = "<:away:498576667061649408>" elseif st == "dnd" then
					statusico = "<:dnd:498576870233735208>" else
						statusico = "<:invisibleoroffline:498576667657109514>"
				end

		local messagee = message.channel:send({embed = {title = "Profile - Info",color = tonumber("0x".. aa),type = "rich",fields = {{
	name = user.username,value = "Status: ".. message.guild:getMember(user.id).status .."\n\nJoined Discord on ".. date .."\n	Joined This Guild on ".. dateg}},
	footer={icon_url = user.avatarURL, text = user.id}
	}}) messagee:addReaction("Emoji: 498548692823834627")
	end
end

if string.lower(message.content) == prefixcom .."profile" then
local year,month,day,hour,minute,second = string.match(message.author.timestamp, "(%d*)-(%d*)-(%d*)T(%d*):(%d*):(%d*)")
date = month.."/".. day .."/".. year ..' (M/D/Y)'
if message.member.joinedAt then
local year,month,day,hour,minute,second = string.match(message.member.joinedAt, "(%d*)-(%d*)-(%d*)T(%d*):(%d*):(%d*)")
dateg = month.."/".. day .."/".. year ..' (M/D/Y)' else dateg = "<error>" end
	aa = string.match(message.member:getColor():toHex(), "#(.*)")
	st=message.member.status
	if st == "online" then
		statusico = "<:online:498576666856128559>" elseif st == "idle" then
			statusico = "<:away:498576667061649408>" elseif st == "dnd" then
				statusico = "<:dnd:498576870233735208>" else
					statusico = "<:invisibleoroffline:498576667657109514>"
			end

			local messagee = message.channel:send({embed = {title = "Profile - Info",color = tonumber("0x".. aa),type = "rich",fields = {{
		name = message.author.username,value = "Status: ".. message.member.status .."\n\nJoined Discord on ".. date .."\n	Joined This Guild on ".. dateg}},
		footer={icon_url = message.author.avatarURL, text = message.author.id}
		}}) messagee:addReaction("Emoji: 498548692823834627")
end

	if message.content == "d.count" then if message.guild.owner then ownee = message.guild.owner.id else ownee = "None" end
	nsfw = 0
	for i, k in pairs(message.guild.textChannels) do if k.nsfw then nsfw = nsfw + 1 end end
		local messagee = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "Server Nums",value =  "Roles:".. #message.guild.roles .."\nCategories: ".. #message.guild.categories.."\nText Channels: " ..#message.guild.textChannels.."\nVoice Channels: ".. #message.guild.voiceChannels
 .."\nEmojis: ".. #message.guild.emojis .."\nOwner: <@".. ownee ..">\nTotal Members:".. message.guild.totalMemberCount .."\n\nNSFW Channels: ".. nsfw}}
}})
 end
 if message.content == "d.voice" then
	 vc = message.member.voiceChannel:join()
	 message.channel:send("connected")
 end
 if message.content == "d.newqueue" then

	 queue = {}
	 message:reply("queue deleted and replaced with empty one")
 end
 if cmd == "d.addqueue" then
	 table.insert(queue, arg)
	 message:reply("new song added to queue")
 end
 if message.content == "d.play" then
	 if vc then
		 message:reply("queue started")
	 coroutine.wrap(function()
		 time = os.time(t)
		 n = 1
		 for i, k in pairs(queue) do
			 message:reply("song ".. n)
	 vc:playFFmpeg(k)
	 local a= message:reply("next song")
	 c = os.time(t) repeat until os.time(t) - c > 3
	 a:delete()
	 n = n+1
 end
	 message.channel:send("finished! played for ".. os.time(t)- time)
 end)()
end
 end
 if cmd == "d.voice" then
	 vc = message.member.voiceChannel:join()
	 message.channel:send(vc)
	 coroutine.wrap(function()
		 message.channel:send("please be patient, sound file is getting ready...")
		 time = os.time(t)
	 vc:playFFmpeg(arg)
	 message.channel:send("finished! played for ".. os.time(t)- time)
 end)()
end
 if message.content == "d.pause" then
	 if vc then vc:pauseStream() end
 end
 if message.content == "d.close" then
	 if vc then vc:close() end
 end
 if message.content == "d.resume" then
	if vc then vc:resumeStream() end
 end
 if cmd == "hoopslua" then
	 warn = "`Fills Text, Type Larger Number...`"
	 table, num = string.match(arg, "(.-) (.*)")
	 if table and num and table ~= "cover" then
		 if string.len(luadocs[table]) >2000 then
		 message:reply(string.sub(luadocs[table], tonumber(num), tonumber(num) + 2000-string.len(warn)).. warn)
		 else
		 message:reply(string.sub(luadocs[table], tonumber(num), tonumber(num) + 2000))
	 end
	 elseif arg and arg ~= "cover" then
		 if string.len(luadocs[arg]) >2000 then
			 message:reply(string.sub(luadocs[arg], 1, 2000- string.len(warn)) ..warn)
		 else
		 message:reply(string.sub(luadocs[arg], 1, 2000))
	 end
	 elseif arg == "cover" or table == "cover" then
		 message.channel:send{files={"Hoopsabot/LuaDocs/cover1.jpg"}}
	 end
 end
 if message.content == "hey hoops" then message:reply("yes?\n`i have no responses yet h blame my creator this stuff takes a bit of work`") end
	if message.content == "hey hoops what is the biggest number you can hold" then
		num = 1
		mem = message.channel:send("I think it's uh...")
		last = os.time(t)
		while true do
			if num * 5 ~= math.huge then num = num +1000000 num = math.floor(num * 1.000001) else break end
		if last+2.5 < os.time(t) then mem:setContent("I think it's uh... ".. string.format("%.0f",num) .." `calculating...`") last = os.time(t) end end
		mem:setContent("I think it's ".. string.format("%.0f",num))
	end
	if message.content == prefixcom .."rank" then
		higher = {}
		rank = 1
		e=0
		for i, k in pairs(udata.rpgStats) do
			e=e+1
			n = 0
			for i = 1, k.level do n = n + i*15 end n = n + k.xp

				pn = 0
				for i = 1, 	udata.rpgStats[message.author.id].level do pn = pn + i*15 end pn = pn + udata.rpgStats[message.author.id].xp
				if pn < n then rank = rank + 1 table.insert(higher, k) end
		end
		msgp = ""
		if rank/e <  0.1 then msgp = ":large_blue_diamond: You are in the top 10%!" end
		if rank/e < 0.05 then msgp = ":large_blue_diamond: You are in the top 5%!" end
		if rank/e < 0.01 then msgp = ":diamond_shape_with_a_dot_inside: You are in the top 1%!" end
		if rank   <   10 then msgp = "<:pd:500498186864033794> You are in the top 10!" end
		if rank   <=   1 then msgp = "<:dd:500498187069423616> You are at the top!" end
		percentage = math.ceil(rank/e*100)
		message.channel:send("👑 Your rank is #".. rank .."/".. e .." ( ".. percentage .."% )\n".. msgp.."\n")
	end
	if message.content == prefixcom .."leader" then
		tab = {}
		for  i, m in pairs(message.guild.members) do table.insert(tab, m.user.id) end
		for i, m in pairs(message.guild.members) do
			k = m.user.id
			if udata.rpgStats[k] == nil then
				if io.open("Hoopsabot/Userdata/RPGStats/".. k ..".lua" ,"r") then
					udata.rpgStats[k] = require("Hoopsabot/Userdata/RPGStats/".. k)
				else
					udata.rpgStats[k] = {
						hp=10, points = 0,
						mhp=10,
						level=1,
						xp=0,
						atk=0,
						def=0,
						equipped={name="Fists",atk=1,def=0, range=1}
					}
				end
			end
		end
		higher = {}
		rank = 1
		e=0
		for i, k in pairs(tab) do
			if message.guild:getMember(k) then
			e=e+1
			n = 0
			if udata.rpgStats[k] then
			for i = 1, udata.rpgStats[k].level do n = n + i*15 end n = n + udata.rpgStats[k].xp

				pn = 0
				for i = 1, 	udata.rpgStats[k].level do pn = pn + i*15 end pn = pn + udata.rpgStats[k].xp
				if pn < n then rank = rank + 1 table.insert(higher, k) end
			end
		end
	end
		msgp = ""
		if rank/e <  0.1 then msgp = ":large_blue_diamond: You are in the top 10%!" end
		if rank/e < 0.05 then msgp = ":large_blue_diamond: You are in the top 5%!" end
		if rank/e < 0.01 then msgp = ":diamond_shape_with_a_dot_inside: You are in the top 1%!" end
		if rank   <   10 then msgp = "<:pd:500498186864033794> You are in the top 10!" end
		if rank   <=   1 then msgp = "<:dd:500498187069423616> You are at the top!" end
		percentage = math.ceil(rank/e*100)
		message.channel:send("👑 Your rank is #".. rank .."/".. e .." ( ".. percentage .."% )\n".. msgp.."\n")
	end

end





if modules.toggle.currency then
	if string.lower(message.content) == prefixcom .."balance" then
		val = ""
 for i, k in pairs(udata.Currencies[message.author.id]) do
	 stored = nil
	 for c, v in pairs(configs.emotes) do if i == c then stored = v end end
	 if stored then
		 val = val .."<".. stored.chat .. stored.emoteid .."> ".. stored.name .." : ".. k .."\n"
	 else
		 val = val ..i .." : ".. k .."\n" end end
	local messagee = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
name = "Balances",value = val}}
}})
	end
		if cmd == prefixcom .."balance" and #message.mentionedUsers == 1 then
			for i, k in pairs(message.mentionedUsers) do
			val = ""
			if udata.Currencies[k.id] == nil then loadcur(k) end
	 for i, k in pairs(udata.Currencies[k.id]) do
		 stored = nil
		 for c, v in pairs(configs.emotes) do if i == c then stored = v end end
		 if stored then
			 val = val .."<".. stored.chat .. stored.emoteid .."> ".. stored.name .." : ".. k .."\n"
		 else
			 val = val ..i .." : ".. k .."\n" end end
		local messagee = message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
	name = "Balances",value = val}}
	}})
	break
		end
	end

	if string.lower(message.content) == prefixcom .."market" or cmd == prefixcom .."market" then
		err, errn = pcall(tonumber(arg))
		if arg == nil then page = 1 else page = tonumber(arg) end
		if string.lower(message.content) == prefixcom .."market" or not errn == "attempt to call a number value" then page = 1 else page = tonumber(arg) end
		val = ""
		n = 0
		if type(page) == "number" then
		for i, k in pairs(market) do
			n = n + 1
			if n > (page-1)*20 and n <= page*20 then
				if type(k.price) == "number" then
				val = val .. "`ID: ".. n .."` "..  k.name .." : ".. k.price .." Market Coins\n"
			else
				if k.price.item then
					if k.price.item == "points" then
				val = val .. "`ID: ".. n .."` "..  k.name .." : ".. k.price.count .." Points\n"
			end
			end
			end
			end
		end
		message.channel:send({embed = {color = configs.colors.alone,type = "rich",fields = {{
	name = "Market",value = val}}
	}})
end

	end

		err, errn = pcall(tonumber(arg))
		if cmd == prefixcom .."buy" and errn == "attempt to call a number value" then
		if market[tonumber(arg)].sellers.bot then
			if type(market[tonumber(arg)].price) == "number" then
			if market[tonumber(arg)].price <= udata.Currencies[message.author.id].marketCoins then
				udata.Currencies[message.author.id].marketCoins = udata.Currencies[message.author.id].marketCoins - market[tonumber(arg)].price
				if market[tonumber(arg)].item.type == "cur" then
					udata.Currencies[message.author.id][market[tonumber(arg)].item.item] = udata.Currencies[message.author.id][market[tonumber(arg)].item.item] + market[tonumber(arg)].item.count
					if market[tonumber(arg)].item.item == "coins" then aa = "credits" else aa = market[tonumber(arg)].item.item end
					message.author:send("You just bought ".. market[tonumber(arg)].item.count .." "..aa .." for ".. market[tonumber(arg)].price ..'!')
				elseif market[tonumber(arg)].item.type == 'item' then
					if type(udata.rpgStats[message.author.id]) == "table" then udata.rpgStats[message.author.id].equipped = market[tonumber(arg)].item.item end
					message.author:send("You just bought a "..market[tonumber(arg)].item.item.name .." for ".. market[tonumber(arg)].price ..'!')
				end
			end
		else
		if market[tonumber(arg)].price.count <= udata.Currencies[message.author.id][market[tonumber(arg)].price.item] then
			udata.Currencies[message.author.id][market[tonumber(arg)].price.item] = udata.Currencies[message.author.id][market[tonumber(arg)].price.item] - market[tonumber(arg)].price.count
			if market[tonumber(arg)].item.type == "cur" then
				udata.Currencies[message.author.id][market[tonumber(arg)].item.item] = udata.Currencies[message.author.id][market[tonumber(arg)].item.item] + market[tonumber(arg)].item.count
				if market[tonumber(arg)].item.item == "coins" then aa = "credits" else aa = market[tonumber(arg)].item.item end
				message.author:send("You just bought ".. market[tonumber(arg)].item.count .." "..aa .." for ".. market[tonumber(arg)].price.count ..'!')
			elseif market[tonumber(arg)].item.type == 'item' then
				if type(udata.rpgStats[message.author.id]) == "table" then udata.rpgStats[message.author.id].equipped = market[tonumber(arg)].item.item end
				message.author:send("You just bought a ".. market[tonumber(arg)].item.item.name .." for ".. market[tonumber(arg)].price.count ..'!')
			end
		end
		end

		end
	end

end

	if modules.toggle.serveri then

		if string.lower(message.content) == prefixcom .."invite" then
			message.author:send("Join the `DEV` server and obtain additional bonuses! https://discord.gg/Nws83HM\nInvite me with https://discordapp.com/api/oauth2/authorize?client_id=490265491810811904&permissions=2146958839&scope=bot")
			 message.author:getPrivateChannel():close()
		end


	end else
		if not modules.external.requestOwners(message.author.id, configs.blocks.botblock) and message.author.bot ~= true then
	client:getUser("115529446370443265"):send("`".. message.author.fullname .." ("..message.author.id ..")`\n".. string.lower(message.content)) message.author:getPrivateChannel():close()
end
	if string.lower(message.content) == "about" then
		message.author:send("`Hoopsabot`\n-\nHello! I'm Hoopsabot! I was made by this one young boy named Tanner and he's been working on me a lot!"..
	"\n\nTo use me, type `{prefix}.modulelist` in a server to see different sets of commands, and use `{prefix}.commands [module]` to see what those commands are.")  message.author:getPrivateChannel():close()
	end
			if string.lower(message.content) == "stats" then
				hp = ""
				if type(udata.rpgStats[message.author.id]) == "table" then
				for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
					if udata.rpgStats[message.author.id].hp-i>=0 and i%10 == 0 then
						hp = hp .. "🔶"
					elseif i%10 == 0 then
						hp = hp .. "▪"
					end
				end
				hp = hp .." ( "..udata.rpgStats[message.author.id].hp .." / ".. udata.rpgStats[message.author.id].mhp .." ) \n"
					xp = ""
					for i = 1, 10 do
						if (udata.rpgStats[message.author.id].xp/(udata.rpgStats[message.author.id].level*15))-(i/10)>=0 then
							xp = xp .. "🔷"
						else
							xp = xp .. "▪"
						end
					end
					xp = xp .." ( "..udata.rpgStats[message.author.id].xp .." / ".. udata.rpgStats[message.author.id].level*15 .." ) "


				 local messagee = message.author:send({embed = {color = configs.colors.kiss,type = "rich",fields = {{
				name = "RPG Stats",value = "Level ".. udata.rpgStats[message.author.id].level .." - ".. udata.rpgStats[message.author.id].points .." Points to Spend\n\nHP: ".. hp .."XP: ".. xp
			.. "\nYour Stats: ATK ".. udata.rpgStats[message.author.id].atk .." | DEF ".. udata.rpgStats[message.author.id].def .."\n\nEquipped: \n"..udata.rpgStats[message.author.id].equipped.name .."\nATK: "..udata.rpgStats[message.author.id].equipped.atk .." | DEF: ".. udata.rpgStats[message.author.id].equipped.def
		.. " | Range: ".. udata.rpgStats[message.author.id].equipped.range .." Tiles"}}
				}})  message.author:getPrivateChannel():close()
			end end
	battle = battles[message.author.id]
	if battle and battles[message.author.id] then
		if string.lower(message.content) == "attack" and battles[message.author.id].positions.enemy+battles[message.author.id].positions.player <= udata.rpgStats[message.author.id].equipped.range*2 then
			battles[message.author.id].opponent.hp = battles[message.author.id].opponent.hp - ((udata.rpgStats[message.author.id].equipped.atk + udata.rpgStats[message.author.id].atk)-battles[message.author.id].opponent.def)
			message.author:send("The enemy took ".. ((udata.rpgStats[message.author.id].equipped.atk + udata.rpgStats[message.author.id].atk)-battles[message.author.id].opponent.def) .." damage!")
		end
		if (string.lower(message.content) == "move forward" or string.lower(message.content) == "move forwards") and battles[message.author.id].positions.player > 1 then battles[message.author.id].positions.player = battles[message.author.id].positions.player - 1
		message.author:send("You moved forwards") end
		if (string.lower(message.content) == "move backward" or string.lower(message.content) == "move backwards") and battles[message.author.id].positions.player < 3 then battles[message.author.id].positions.player = battles[message.author.id].positions.player + 1
		message.author:send("You moved backwards")  end
		if battles[message.author.id].positions.enemy+battles[message.author.id].positions.player > battles[message.author.id].opponent.range*2 then battles[message.author.id].positions.enemy = battles[message.author.id].positions.enemy - 1

						hp = ""
						for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
							if udata.rpgStats[message.author.id].hp-i>=0 and i%5 == 0 then
								hp = hp .. "🔶"
							elseif i%5 == 0 then
								hp = hp .. "▪"
							end
						end ohp = ""for i = 1, math.floor(battles[message.author.id].opponent.mhp) do	if battles[message.author.id].opponent.hp-i>=0 and i%5 == 0 then	ohp = ohp .. "🔶"elseif i%5 == 0 then ohp = ohp .. "▪" end end
		message.author:send("The enemy approaches\nYour HP: ".. hp .."\nEnemy HP: ".. ohp .." ( ".. battles[message.author.id].opponent.hp .." ) ")
	else if (battles[message.author.id].opponent.atk - (udata.rpgStats[message.author.id].equipped.def + udata.rpgStats[message.author.id].def)) > 0 then udata.rpgStats[message.author.id].hp = udata.rpgStats[message.author.id].hp - (battles[message.author.id].opponent.atk - (udata.rpgStats[message.author.id].equipped.def + udata.rpgStats[message.author.id].def))

			hp = ""
			for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
				if udata.rpgStats[message.author.id].hp-i>=0 and i%5 == 0 then
					hp = hp .. "🔶"
				elseif i%5 == 0 then
					hp = hp .. "▪"
				end
			end ohp = ""for i = 1, math.floor(battles[message.author.id].opponent.mhp) do	if battles[message.author.id].opponent.hp-i>=0 and i%5 == 0 then	ohp = ohp .. "🔶"elseif i%5 == 0 then ohp = ohp .. "▪" end end
	message.author:send("You took ".. (battles[message.author.id].opponent.atk - (udata.rpgStats[message.author.id].equipped.def + udata.rpgStats[message.author.id].def)) .." damage!\n Your HP: ".. hp.."\nEnemy HP: ".. ohp .." ( ".. battles[message.author.id].opponent.hp .." ) ")
else
	hp = ""
	for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
		if udata.rpgStats[message.author.id].hp-i>=0 and i%5 == 0 then
			hp = hp .. "🔶"
		elseif i%5 == 0 then
			hp = hp .. "▪"
		end
	end ohp = ""for i = 1, math.floor(battles[message.author.id].opponent.mhp) do	if battles[message.author.id].opponent.hp-i>=0 and i%5 == 0 then	ohp = ohp .. "🔶"elseif i%5 == 0 then ohp = ohp .. "▪" end end
	message.author:send("You took no damage!\n Your HP: ".. hp.."\nEnemy HP: ".. ohp .." ( ".. battles[message.author.id].opponent.hp .." ) ")  end end
if battles[message.author.id] then
if battles[message.author.id].opponent.hp <= 0 then message.author:send("The enemy has died! You have earned ".. battles[message.author.id].opponent.xp .." experience!") udata.rpgStats[message.author.id].xp = udata.rpgStats[message.author.id].xp + battles[message.author.id].opponent.xp
battles[message.author.id].opponent = nil battles[message.author.id] = nil
battle = nil end end
	else
		if string.lower(message.content) == "heal cost" then
			healcost = math.floor((udata.rpgStats[message.author.id].mhp - udata.rpgStats[message.author.id].hp)/3)
			message.author:send("Healing will cost ".. healcost .." credits")
		elseif string.lower(message.content) == "heal buy" then
			healcost = math.floor((udata.rpgStats[message.author.id].mhp - udata.rpgStats[message.author.id].hp)/3)
		if udata.rpgStats[message.author.id].hp < udata.rpgStats[message.author.id].mhp and udata.Currencies[message.author.id].coins >= healcost then
udata.rpgStats[message.author.id].hp = udata.rpgStats[message.author.id].mhp
udata.Currencies[message.author.id].coins = udata.Currencies[message.author.id].coins - healcost
message.author:send("You healed to max health for ".. healcost .."!")
		end
		end
		if (string.lower(message.content) == "point hp" or string.lower(message.content) == "point health") then
		if udata.rpgStats[message.author.id].points > 0 then udata.rpgStats[message.author.id].mhp = udata.rpgStats[message.author.id].mhp + 2 udata.rpgStats[message.author.id].points = udata.rpgStats[message.author.id].points - 1
		message.author:send("You spent one point on HP") end
	elseif (string.lower(message.content) == "point atk" or string.lower(message.content) == "point attack") then
	if udata.rpgStats[message.author.id].points > 0 then udata.rpgStats[message.author.id].atk = udata.rpgStats[message.author.id].atk + 1 udata.rpgStats[message.author.id].points = udata.rpgStats[message.author.id].points - 1
	message.author:send("You spent one point on Attack") end
elseif (string.lower(message.content) == "point def" or string.lower(message.content) == "point defense") then
	if udata.rpgStats[message.author.id].points > 0 then udata.rpgStats[message.author.id].def = udata.rpgStats[message.author.id].def + 1 udata.rpgStats[message.author.id].points = udata.rpgStats[message.author.id].points - 1
	message.author:send("You spent one point on Defense") end
		end
		if string.lower(message.content) == "generate battle" then
			message.author:send("Generating Battle...")
			local enem = ""
			local name = ""
			n = 0
			ran = math.random(1, #configs.enemies)
			ran = math.ceil((ran + math.random(1, #configs.enemies))/2)
			for i, k in pairs(configs.enemies) do n = n + 1 if k.level <= udata.rpgStats[message.author.id].level then if type(enem) == "table" then if enem.level < k.level then --[[if ran == n then]] enem = k name = i end else enem = k name = i end end end--end-- else
				if enem == "" then enem = configs.enemies.spider name = "spider" end
			battles[message.author.id] = {opponent = enem, positions={player=2,enemy=2}} battles[message.author.id].opponent.hp = battles[message.author.id].opponent.mhp
						hp = ""
						for i = 1, math.floor(udata.rpgStats[message.author.id].mhp) do
							if udata.rpgStats[message.author.id].hp-i>=0 and i%5 == 0 then
								hp = hp .. "🔶"
							elseif i%5 == 0 then
								hp = hp .. "▪"
							end
						end battle = battles[message.author.id] ohp = ""for i = 1, math.floor(battles[message.author.id].opponent.mhp) do	if battles[message.author.id].opponent.hp-i>=0 and i%5 == 0 then	ohp = ohp .. "🔶"elseif i%5 == 0 then ohp = ohp .. "▪" end end
			message.author:send("A Level ".. battles[message.author.id].opponent.level .." ".. name .." has appeared! Oh whatever will you do?\nYour HP: ".. hp .."\nEnemy HP: ".. ohp .." ( ".. battles[message.author.id].opponent.hp .." ) ")
		end
	end
end
end



if type(udata.Currencies[message.author.id]) == "table" then
aa = io.open("Hoopsabot/Userdata/Currency/".. message.author.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(udata.Currencies[message.author.id]) do
ee = ee .."ret.".. i .." = ".. k .."\n"
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
end
if type(udata.pref[message.author.id]) == "table" then
aa = io.open("Hoopsabot/Userdata/Preferences/".. message.author.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(udata.pref[message.author.id]) do
	if i then
	if k == true then
ee = ee .."ret.".. i .." = true\n" elseif k == false then
ee = ee .."ret.".. i .." = false\n" elseif type(k) == "table" then
ee = ee .."ret.".. i .." = {}\n"
for l, v in pairs(k) do ee = ee .."ret."..i..""..l .." = '".. v .."'\n" end else
ee = ee .."ret.".. i .." = ".. k .."\n" end
end
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
end

if message.guild then if type(gdata[message.guild.id]) == "table" then
aa = io.open("Hoopsabot/GuildDat/".. message.guild.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(gdata[message.guild.id]) do
	if i then
	if k == true then
ee = ee .."ret.".. i .." = true\n" elseif k == false then
ee = ee .."ret.".. i .." = false\n" elseif type(k) == "table" then
ee = ee .."ret.".. i .." = {}\n"
for l, v in pairs(k) do if type(v) ~= "boolean" then ee = ee .."ret."..i..""..l .." = '".. v .."'\n"
elseif v == true then ee = ee .."ret."..i..""..l .." = 'true'\n" else
ee = ee .."ret."..i..""..l .." = 'false'\n" end end else
ee = ee .."ret['".. i .."'] = '".. k .."'\n" end
end
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
end end

if type(udata.rpgStats[message.author.id]) ~= "boolean" then if math.random(1,100)<100 then udata.rpgStats[message.author.id].xp = udata.rpgStats[message.author.id].xp + 1 end
if udata.rpgStats[message.author.id].xp >= udata.rpgStats[message.author.id].level*15 then
	udata.rpgStats[message.author.id].xp = udata.rpgStats[message.author.id].xp - udata.rpgStats[message.author.id].level*15
	udata.rpgStats[message.author.id].level = udata.rpgStats[message.author.id].level + 1
	udata.rpgStats[message.author.id].points = udata.rpgStats[message.author.id].points + 1
	aa = math.random(1,3)
	if udata.pref[message.author.id].levelnotify then message.author:send("LEVEL UP!!! Level ".. udata.rpgStats[message.author.id].level .."\n+1 Stat Point to Spend\n\nType `{prefix}.rpgstats` in a server to check your stats!")
	 message.author:getPrivateChannel():close() else end
end
aa = io.open("Hoopsabot/Userdata/RPGStats/".. message.author.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(udata.rpgStats[message.author.id]) do
	if type(k) ~= "table" then
ee = ee .."ret.".. i .." = ".. k .."\n"
else
	ee = ee .."ret.".. i .." = {\n"
	for c, v in pairs(k) do
		if type(v) ~= "string" then
ee = ee .."".. c .." = ".. v ..",\n"
else
ee = ee .."".. c .." = '".. v .."',\n"
end
	end
	ee = ee .."}\n"
end
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
end
end)
client:run("Bot ".. configs.system.token)
