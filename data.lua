-- Global configuration
fields = {
  sitename = "Werc",
}

-- Store global variables as Lua code in the database.
-- Any other Lua file may load them with: CodeLib():import("globals")
OnReady(function()

  -- Prepare a CodeLib object and clear the "globals" key
  codelib = CodeLib()

  -- Store the configuration strings as Lua code under the key "globals".
  local first = true
  for k, v in pairs(fields) do
    luaCode = k .. "=\"" .. v .. "\""
    if first then
      codelib:set("globals", luaCode)
      first = false
    else
      codelib:add("globals", luaCode)
    end
  end

end)
