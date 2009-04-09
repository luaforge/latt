local print = print
local ipairs = ipairs

local os = os

local oop = require "loop.base"

module("latt.ConsoleResultViewer", oop.class)

function __init(self, result)
  return oop.rawnew(self, { result = result, })
end

function show(self)
  print("==============================================")
  print("LATT (Lua Automated Testing Tool) version 1.0\n")
  print("Time: "..os.difftime(self.result.stopTime, self.result.startTime).." second(s)\n")
  if self.result.failureCounter ~= 0 then
    print("There were "..self.result.failureCounter.." failure(s):")
    for i, failure in ipairs(self.result.failures) do
      print(i..") "..failure.testCaseName.." - "..failure.testName)
      print(failure.errorMessage.."\n")
    end
    print("FAILURES!!!")
    print("Tests run: "..self.result.testCounter..",  Failures: "..self.result.failureCounter.."")
  else
    print("OK ("..self.result.testCounter.." tests)")
  end
  print("==============================================")
end
