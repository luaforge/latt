local pcall = pcall

local oop = require "loop.base"

module("latt.Test", oop.class)

function run(self, result)
  result:startTest(self.name)
  local _, errorMessage = pcall(self.test, self.testCase)
  result:stopTest(errorMessage)
end
