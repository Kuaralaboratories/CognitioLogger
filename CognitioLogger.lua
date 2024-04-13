local cognitiolog = { _version = "0.0.1" }

cognitiolog.usecolor = true
cognitiolog.outfile = nil
cognitiolog.level = ""


local colors = {
  { name = "Error", color = "\27[31m", },
  { name = "Fail", color = "\27[35m", },
  { name = "Glitch", color = "\27[33m", },
  { name = "Defect", color = "\27[32m", },
  { name = "Fault", color = "\27[34m", },
  { name = "Anomaly", color = "\27[36m", },
  { name = "Info", color = "\27[34m", },
  { name = "", color = "\27[37m", },
}


local levels = {}
for i, v in ipairs(colors) do
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


for i, x in ipairs(colors) do
  local nameupper = x.name:upper()
  cognitiolog[x.name] = function(...)

    -- Return early if we're below the log level
    if i < levels[cognitiolog.level] then
      return
    end

    local message = tostring(...)
    local info = debug.getinfo(2, "Sl")
    local lineinfo = info.short_src .. ":" .. info.currentline

    -- Output to console
    print(string.format("%s[%-6s%s]%s %s: %s",
                        cognitiolog.usecolor and x.color or "",
                        nameupper,
                        os.date("%H:%M:%S"),
                        cognitiolog.usecolor and "\27[0m" or "",
                        lineinfo,
                        message))

    -- Output to log file
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
