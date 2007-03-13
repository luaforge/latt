local ipairs = ipairs

local oop = require "loop.base"

local TestResult = require "latt.TestResult"

module("latt.TestSuite", oop.class)

function run(self)
  local result = TestResult{testSuiteName = self.name}
  result:startTestSuite(self.name)
  for _, testCase in ipairs(self.testCases) do
    testCase:run(result)
  end
  result:stopTestSuite()
  return result
end
