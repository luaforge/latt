local os = os
local table = table

local oop = require "loop.base"

module("latt.TestResult", oop.class)

function startTestSuite(self, suiteName)
  self.suiteName = suiteName
  self.testCounter = 0
  self.failureCounter = 0
  self.failures = {}
  self.startTime = os.time()
end

function stopTestSuite(self)
  self.stopTime = os.time()
end

function startTestCase(self, testCaseName)
  self.currentTestCaseName = testCaseName
end

function stopTestCase(self)
  self.currentTestCaseName = nil
end

function startTest(self, testName)
  self.currentTestName = testName
end

function stopTest(self, errorMessage)
  self.testCounter = self.testCounter + 1
  if errorMessage then
    self.failureCounter = self.failureCounter + 1
    table.insert(self.failures, {testCaseName = self.currentTestCaseName, testName = self.currentTestName, errorMessage = errorMessage, })
  end
  self.currentTestName = nil
end
