local ret = {}
ret.singlesendt={log={}}
local clock = os.clock
function ret.sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
function ret.requestOwners(task, table)
	a = false
for i, k in pairs(table) do
	if task == k then
		a = true
	end
	end
	return a
end
function ret.read(table, tabs, user)
	if tabs == nil then tabs = 0 end
	local tab = ""
	for i = 1, tabs do
tab = tab .."    "
	end
for i, k in pairs(table) do
	if type(k) == "table" then
		print(tab .. i .." : ".. type(k))
		read(k,tabs + 1)
	elseif type(k) == "function" then
		print(i .." | function type")
	else
		if k == true then
		print(tab ..i .." : true")
			elseif k == false then
		print(tab..i .." : false")
			else
		print(tab..i .." : ".. k)
		if i == "description" then
		end
			end
	end
end
end

function ret:bool(bool)
if bool == true then return "Enabled" else return "Disabled" end
end

function ret:singlesend(text,message)
  local name = ""
  for i=1, string.len(text) do
name = name .. string.byte(text, i)
  end
  if ret.singlesendt.log[name] == nil then
ret.singlesendt.log[name] = true
message.channel:send(text)
else
end
end

function ret:send(text, message,ignores)
  for i = 1, #ignores do
    print(ignores[i])
    print(message.author.fullname)
    if message.author.fullname == ignores[i] then
      print("ERROR | Ignore Alignment")
      return nil
end
end
message.channel:send(text)
end

function ret:cosend(channel,message,wait,client,guild)
local corou = coroutine.create(function ()
ret.sleep(wait)
local sendmessage = client:getGuild(guild):getChannel(channel):send(message)
print(sendmessage.id)
end)
print(coroutine.status(corou))
coroutine.resume(corou)
print("potential success?")
print(coroutine.status(corou))
end
return ret
