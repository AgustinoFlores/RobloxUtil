# RobloxUtil
A module script that contains many utilities for Roblox, including new methods for strings and tables.
You can find the module script here: [Roblox Util](https://www.roblox.com/library/2440711100/RobloxUtil)

# Usage
To use the module, import the module in your script as follows. Please note that the Roblox editor will say the functions are not defined in your script, this is perfectly fine the functions work during runtime, they all run. 

```lua
  require(locationOfModule)()
```

From there you can use any of the methods the Utility script has. For example if you want to use the switch case statement you would do the following:

```lua
  local item = 5
  local val = switch(item){
    ["1"] = "Hi",
    ["2"] = "Bye",
    ["5"] = "This is it",
    default = "Not here"
  }
  
  print(val)
```
Output:
```
  This is it
```
Along with this you are able to change the names of both the strings and tables tables to whatever you desire in this section.

```lua
  local stringName = "strings"
  local tableName = "tables"
```

To use the two tables in your scripts just call your variable name followed by a dot.

```lua
  local str = "Hello World!"
  print(strings.startsWith(str, "Hello"))
```
Output:
```
  true
```

For more information on all the methods and usages in this module script refer to the official documentation located [here](https://github.com/AgustinoFlores/RobloxUtil/wiki). I hope you enjoy using this!
