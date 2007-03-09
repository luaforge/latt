local pcall = pcall
local unpack = unpack
local error = error
local tostring = tostring

local oop = require "loop.base"

module("latt.Check", oop.class)

function assertError(f, ...)
  local success = pcall(f, unpack(arg))
  if success then
    error()
  end
end

function assertEquals(expected, actual)
  if expected ~= actual then
    error()
  end
end

function assertNotEquals(expected, actual)
  if expected == actual then
    error("The expected value ("..expected..") shouldn't be equal the actual value ("..actual..").")
  end
end

function assertTrue(condition)
  if condition == false then
    error("Condition should be true.", 2)
  end
end

function assertFalse(condition)
  if condition == true then
    error("Condition should be false.", 2)
  end
end

function assertNil(variable)
  if variable ~= nil then
    error("Variable should be nil: "..tostring(variable))
  end
end

function assertNotNil(variable)
  if variable == nil then
    error()
  end
end
