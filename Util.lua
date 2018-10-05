local module = {}

local stringName = "strings"
local tableName = "tables"

local miscItems = require(script["Misc."])

for i, v in pairs(miscItems) do
	module[i] = v
end

module[stringName] = require(script.Strings)
module[tableName] = require(script.Tables)


setmetatable(module, 
{
	__call = function(this)
		local thisScript = module
		local parentScript = getfenv(2)
		
		for i, v in pairs(thisScript) do
			if type(v) == "function" or type(v) == "table" then
				parentScript[i] = v
			end
		end
	end
})

return module