local error = error
local pairs = pairs
local type = type

local string = string
local table = table

local oop = require "loop.base"

local Test = require "latt.Test"
local TestCase = require "latt.TestCase"
local TestSuite = require "latt.TestSuite"

module("latt.TestRunner", oop.class)

function __init(self, suite)
  return oop.rawnew(self, { suite = suite, })
end

function run(self)
  local testCases = {}
  for testCaseName, testCase in pairs(self.suite) do
    if (string.sub(testCaseName, 1, 4) == "Test") and (type(testCase) == "table") then
      local tests = {}
        for testName, test in pairs(testCase) do
          if (string.sub(testName, 1, 4) == "test") and (type(test) == "function") then
            table.insert(tests, Test(testName, test, testCase))
          end
        end
        table.insert(testCases, TestCase(testCaseName, testCase, tests))
    end
  end

  local suite = TestSuite(self.suite.name, testCases)
  return suite:run()
end
