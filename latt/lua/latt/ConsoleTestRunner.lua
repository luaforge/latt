if #arg ~= 1 then
  io.stderr:write("Use: lua ConsoleTestRunner.lua <test_suite_file_name>\n")
  os.exit(1)
end

local TestRunner = require("latt.TestRunner")
local ConsoleResultViewer = require("latt.ConsoleResultViewer")

dofile(arg[1])

local testRunner = TestRunner{suite = Suite}
local result = testRunner:run()
local viewer = ConsoleResultViewer{result = result}
viewer:show()
