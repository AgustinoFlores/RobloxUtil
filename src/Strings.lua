local module = {}

function module.split(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c)
		fields[#fields + 1] = c
	end)
		
	return fields
end

function module.charAt(str, index)
	return string.sub(str, index, index)
end

function module.startsWith(str, pattern)
	return str:sub(1, pattern:len()) == pattern
end

function module.endsWith(str, pattern)
	return str:sub(str:len() - pattern:len() + 1) == pattern
end

function module.toArray(str)
	local arr = {}
	
	for i = 1, #str, 1 do
		table.insert(arr, i, str:sub(i, i))
	end
	
	return arr
end

function module.trim(str, pattern)
	if string.find(str, pattern) then
		local pos = string.find(str, pattern)
		
		return str:sub(1, pos - 1)
	else
		return str
	end
end

function module.firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

return module