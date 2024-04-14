--[[
  Copyright (C) Kuara Laboratories

  This software has been developed by Kuara Laboratories for Cognitio project 
  and licensed as MIT License. Projects is assigned to Yakup Cemil Kayabaş.

  Inspired by https://github.com/rxi/log.lua

  This software is released under the MIT License.
  https://opensource.org/licenses/MIT
]]

local cognitiolog = { _version = "0.0.1" }

cognitiolog.usecolor = true
cognitiolog.outfile = nil
cognitiolog.level = "minimum"

local customLogs = {
  { name = "minimum", color = "\27[37m", },
  { name = "info", color = "\27[34m", },
  { name = "defect", color = "\27[32m", },
  { name = "anomaly", color = "\27[36m", },
  { name = "fault", color = "\27[34m", },
  { name = "glitch", color = "\27[33m", },
  { name = "fail", color = "\27[35m", },
  { name = "error", color = "\27[31m", },
}

local function addCustomLogs(name, color)
  table.insert(customLogs, {name = name, color = color})
end

local logs = customLogs

local levels = {}
for i, v in ipairs(logs) do
  levels[v.name] = i
end


local round = function(x, increment)
  increment = increment or 1
  x = x / increment
  return (x > 0 and math.floor(x + .5) or math.ceil(x - .5)) * increment
end

local _tostring = tostring

local tostring = function(...)
  local t = {}
  for i = 1, select('#', ...) do
    local x = select(i, ...)
    if type(x) == "number" then
      x = round(x, .01)
    end
    t[#t + 1] = _tostring(x)
  end
  return table.concat(t, " ")
end


for i, x in ipairs(logs) do
  local nameupper = x.name:upper()
  cognitiolog[x.name] = function(...)

    if i < levels[cognitiolog.level] then
      return
    end

    local message = tostring(...)
    local info = debug.getinfo(2, "Sl")
    local lineinfo = info.short_src .. " :" .. info.currentline

    print(string.format("%s[%-6s%s]%s %s: %s",
                        cognitiolog.usecolor and x.color or "",
                        nameupper,
                        os.date("%H:%M:%S"),
                        cognitiolog.usecolor and "\27[0m" or "",
                        lineinfo,
                        message))

    if cognitiolog.outfile then
      local fp = io.open(cognitiolog.outfile, "a")
      local str = string.format("[%-6s%s] %s: %s\n",
                                nameupper, os.date(), lineinfo, message)
      fp:write(str)
      fp:close()
    end

  end
end

return cognitiolog