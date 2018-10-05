local module = {}

function module.indexOf(tab, value)
	for i, v in pairs(tab) do
		if v == value then
			return i
		end
	end
		
	return nil
end

function module.inTable(tab, value)
	for i, v in pairs(tab) do
		if v == value then
			return true
		end
	end
	
	return false
end

function module.reverse(tab)
	local newTable = {}
	local success, err = pcall(function()
		for i = #tab, 1, -1 do
			table.insert(newTable, tab[i])
		end
	end)
	
	if success then
		return newTable
	else
		warn(err)
	end
end

function module.slice(tab, startIndex, endIndex)
	local newTab = {}
	
	for i = startIndex, endIndex, 1 do
		table.insert(newTab, tab[i])
	end
	
	return newTab
end

function module.splice(tab, startIndex, remove, ...)
	local args = {...}
	local removed = {}
	
	for i = startIndex + remove - 1, startIndex, -1 do
		table.insert(removed, tab[i])
		table.remove(tab, i)
	end
	
	for i, v in pairs(args) do
		table.insert(tab, startIndex + (i - 1), v) 
	end
	
	return removed
end

function module.insert(tab, index, val)
	if val == nil then
		table.insert(tab, index)
	else
		if type(index) == "number" then
			table.insert(tab, index, val)
		else
			tab[index] = val
		end
	end
end

function module.remove(tab, index)
	for i, v in pairs(tab) do
		if i == index then
			tab[i] = nil
		end
	end
end

function module.removeValue(tab, value)
	for i, v in pairs(tab) do
		if v == value then
			tab[i] = nil
		end
	end
end

function module.copyTable(refTable)
	local newTable = {}
	
	for i, v in pairs(refTable) do
		if type(v) == "table" then
			newTable[i] = module.copyTable(v)
		else
			newTable[i] = v
		end
	end
	
	return newTable
end

return module