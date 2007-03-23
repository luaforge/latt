if #arg ~= 1 then
  io.stderr:write("Use: lua OiLTestRunner.lua <test_suite_file_name>\n")
  os.exit(1)
end

require "oil"

latt = {}
latt.pcall = oil.pcall

dofile(arg[1])
if not Suite then
  error("Suite not found !!!")
end

local TestRunner = require("latt.TestRunner")
local ConsoleResultViewer = require("latt.ConsoleResultViewer")

function runTest()
  local testRunner = TestRunner(Suite)
  local status, result = latt.pcall(testRunner.run, testRunner)
  if not status then
    print(result)
    return
  end
  local viewer = ConsoleResultViewer(result)
  viewer:show()
end

function main()
  oil.newthread(oil.run)

  local status, result = latt.pcall(runTest)
  if not status then
    print(result)
  end

  os.exit()
end

oil.main(main)
