local function read_file(path)
    local file = io.open(scriptdir(path), "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function main()
  CodeLib():import("globals")
  local mdContents = markdown(read_file("main.md"))
  serve2("common.po2", {contents=mdContents, sitename=sitename})
end

main()
