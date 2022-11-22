-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- (c) Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

-- Class Himmelskoerper
Himmelskoerper = {}
Himmelskoerper.__index = Himmelskoerper

function Himmelskoerper.new (name, masse, radius, position, geschwindigkeit, farbe)  
  local instance = setmetatable({}, Himmelskoerper)
  instance.name = name
  instance.masse = masse
  instance.radius = radius
  instance.position = position
  instance.geschwindigkeit = geschwindigkeit
  instance.farbe = farbe
  return instance
end

function Himmelskoerper:print()
  print("**** Himmelskörper ****")
  print("  Name: ", self.name)
  print("  Masse in kg: ", self.masse)
  print("  Radius in km: ", self.radius)
  print("  Position in km: ", self.position)
  print("  Geschwindigkeit in km/h: ", self.geschwindigkeit, "\n")
  print("  Farbe: ", self.farbe, "\n")
end
