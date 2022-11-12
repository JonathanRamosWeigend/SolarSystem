-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

-- LuaUnit Testcase
luaunit = require('luaunit')
himmelskoerper = require "himmelskoerper" 

function testNew()
  erde = Himmelskoerper.new("Erde", 1.0*10^6, 1.6*10^4, "", "")
  sonne = Himmelskoerper.new("Sonne", 1.0*10^8, 3.0*10^5, "", "")
  luaunit.assertEquals(erde.radius, 16000)
end

function testPrint()
  erde = Himmelskoerper.new("Erde", 1.0*10^6, 1.6*10^4, "", "")
  sonne = Himmelskoerper.new("Sonne", 1.0*10^8, 3.0*10^5, "", "")
  erde:print()
  sonne:print()
end

luaunit.LuaUnit.run() 