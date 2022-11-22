-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

-- LuaUnit Testcase
luaunit = require('luaunit')
sonnensystem = require "sonnensystem" 

function testNew()
    sonnensystem = Sonnensystem.new()
end

function testPrint()
  sonnensystem = Sonnensystem.new() 
  sonnensystem:tick()
  sonnensystem:tick()
  sonnensystem:tick()
  sonnensystem:print()
end

luaunit.LuaUnit.run() 