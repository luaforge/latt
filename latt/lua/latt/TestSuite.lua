local ipairs = ipairs

local oop = require "loop.base"

local TestResult = require "latt.TestResult"

module("latt.TestSuite", oop.class)

function __init(self, name, testCases)
  return oop.rawnew(self, { name = name, testCases = testCases, })
end

function run(self)
  local result = TestResult(self.name)
  result:startTestSuite()
  for _, testCase in ipairs(self.testCases) do
    testCase:run(result)
  end
  result:stopTestSuite()
  return result
end
