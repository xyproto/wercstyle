function main()
  CodeLib():import("globals")
  local htmlContents = markdown("# Site map")

  -- Find subdirectories with .md files
  local l = run("find .. -wholename '*.md' -mindepth 2 -maxdepth 3 -type f -printf '%P\n' | sort")

  -- Create an unordered list
  htmlContents = htmlContents .. "<ul>"
  for k, v in pairs(l) do
    dirName = v:match("(.*/)")
    htmlContents = htmlContents .. "<li><a href=\"" .. "/" .. dirName .. "\">" .. dirName .. "</a>" .. "</li>"
  end
  htmlContents = htmlContents .. "</ul>"

  -- Render the contents
  serve2("../common.po2", {contents=htmlContents, sitename=sitename})
end

main()
