local oop = require "loop.base"

local latt = latt

module("latt.Test", oop.class)

function __init(self, name, test, testCase)
  return oop.rawnew(self, { name = name, test = test, testCase = testCase, })
end

function run(self, result)
  result:startTest(self.name)
  local _, errorMessage = latt.pcall(self.test, self.testCase)
  result:stopTest(errorMessage)
end
