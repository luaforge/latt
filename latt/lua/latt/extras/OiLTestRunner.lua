if #arg ~= 1 then
  io.stderr:write("Use: lua OiLTestRunner.lua <test_suite_file_name>\n")
  os.exit(1)
end

require "oil"

pcall = oil.pcall

local TestRunner = require("latt.TestRunner")
local ConsoleResultViewer = require("latt.ConsoleResultViewer")

function main()
  oil.newthread(oil.run)

  dofile(arg[1])

  local testRunner = TestRunner{suite = Suite}
  local status, result = pcall(testRunner.run, testRunner)
  if not status then
    print(result)
    return
  end
  local viewer = ConsoleResultViewer{result = result}
  viewer:show()
end

oil.main(main)
