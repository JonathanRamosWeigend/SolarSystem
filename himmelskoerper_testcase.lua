-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

-- LuaUnit Testcase
luaunit = require('luaunit')
himmelskoerper = require "himmelskoerper" 

function testNew()
  erde = Himmelskoerper.new("Erde", "1MioT", "16.000km", "", "")
  sonne = Himmelskoerper.new("Sonne", "100MioT", "300.000km", "", "")
  luaunit.assertEquals(erde.radius,"16.000km")
end

function testPrint()
  erde = Himmelskoerper.new("Erde", "1MioT", "16.000km", "", "")
  sonne = Himmelskoerper.new("Sonne", "100MioT", "300.000km", "", "")
  erde:print()
  sonne:print()
end

luaunit.LuaUnit.run() 

