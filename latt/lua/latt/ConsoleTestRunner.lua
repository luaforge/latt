if #arg ~= 1 then
  io.stderr:write("Use: lua ConsoleTestRunner.lua <test_suite_file_name>\n")
  os.exit(1)
end

dofile(arg[1])
if not Suite then
  error("Suite not found !!!")
end

local TestRunner = require("latt.TestRunner")
local ConsoleResultViewer = require("latt.ConsoleResultViewer")

local testRunner = TestRunner(Suite)
local result = testRunner:run()
local viewer = ConsoleResultViewer(result)
viewer:show()
