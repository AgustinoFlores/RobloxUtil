local module = {}

local switch = {}
setmetatable(switch, {
	__call = function(self, item)
		if not item then
			warn("Switch statement needs a value to be compared")
		else
			return function(data)
				for i, v in pairs(data) do
					if item == module.convertFromString(i) then
						if type(v) == "function" then
							return v()
						else
							return v
						end
					end
				end
				
				if data.default then
					return data.default
				end
				
				warn("No default value given, switch case will return nil")
				return nil
			end
		end
	end
})

function module.scale(x, y)
	return UDim2.new(x, 0, y, 0)
end

function module.offset(x, y)
	return UDim2.new(0, x, 0, y)
end

function module.size(xScale, xOffset, yScale, yOffset)
	return UDim2.new(xScale, xOffset, yScale, yOffset)
end

function module.getPlayersByTeam(...)
	local players = {}
	local teams = {...}
	
	for i, v in pairs(teams) do
		if type(v) == "table" then
			for index, team in pairs(v) do
				print(team)
				for _, plr in pairs(team:GetPlayers()) do
					table.insert(players, plr)
				end
			end
		else
			for _, plr in pairs(v:GetPlayers()) do
				table.insert(players, plr)
			end
		end
		
	end
	
	return players
end

function module.randomizeTeam(playersTable, teams)
	local players = module.copyTable(playersTable)
	local teamIndex = 1
	if #teams > 1 then
		while #players > 0 do
			local ranPlayer = math.random(1, #players)
			
			if players[ranPlayer] ~= nil and players[ranPlayer].Parent ~= nil then
				players[ranPlayer].Team = teams[teamIndex]
				teamIndex = teamIndex + 1
				
				if teamIndex > #teams then
					teamIndex = 1
				end
				
				table.remove(players, ranPlayer)
			end
		end
	elseif #teams == 1 then
		for i, v in pairs(players) do
			v.Team = teams[1]
		end
	end
end

function module.convertFromString(val)
	if val == "true" then
		return true
	end
	
	if val == "false" then
		return false
	end
	
	if val == "nil" or val == "null" then
		return nil
	end
	
	local num = tonumber(val)
	
	if num ~= nil and tostring(num) == val then
		return num
	end
	
	return val
end

function module.debounce(func)
	local isRunning = false
	
	return function(...)
		if not isRunning then
			isRunning = true
			func(...)
			isRunning = false
		end
	end
end

function module.valueNoParent(valType, name, value)
	local inst
	local success, err = pcall(function()
		inst = Instance.new(valType)
		inst.Name = name
		inst.Value = value
	end)
	
	if success then
		return inst
	else
		warn(err)
	end
end

function module.createValue(valType, parent, name, value)
	local inst
	local success, err = pcall(function()
		inst = Instance.new(valType, parent)
		inst.Name = name
		inst.Value = value
	end)
	
	if success then
		return inst
	else
		warn(err)
	end
end

function module.ClearChildren(inst, exempt)
	if exempt == nil then
		inst:ClearAllChildren()
	end
	
	for i, v in pairs(inst:GetChildren()) do
		if not IsInTable(exempt, v.Name) then
			v:Destroy()
		end
	end
end

module.switch = switch

--Helper Functions
function IsInTable(tab, item)
	for i,v in pairs(tab) do
		if v == item then
			return true
		end
	end
	
	return false
end

return module
