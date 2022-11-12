-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- Jonathan Ramos Weigend, Johannes Weigend
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
  print("  Masse: ", self.masse)
  print("  Radius: ", self.radius)
  print("  Position: ", self.position)
  print("  Geschwindigkeit: ", self.geschwindigkeit, "\n")
end
