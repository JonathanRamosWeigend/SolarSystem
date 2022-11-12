-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- (c) Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

-- Class Himmelskoerper
Himmelskoerper = {}
Himmelskoerper.__index = Himmelskoerper

function Himmelskoerper.new (name, masse, radius, position, geschwindigkeit)  
  local instance = setmetatable({}, Himmelskoerper)
  instance.name = name
  instance.masse = masse
  instance.radius = radius
  instance.position = position
  instance.geschwindigkeit = geschwindigkeit
  return instance
end

function Himmelskoerper:print()
  print("**** Himmelskörper ****")
  print("  Name: ", self.name)
  print("  Masse in kg: ", self.masse)
  print("  Radius in km: ", self.radius)
  print("  Position in km: ", self.position)
  print("  Geschwindigkeit: ", self.geschwindigkeit, "\n")
end
