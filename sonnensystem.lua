-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- (c) Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

himmelskoerper = require "himmelskoerper" 
utils = require "utils" 
colors = require "colors"

-- Class Himmelskoerper
Sonnensystem = {}
Sonnensystem.__index = Sonnensystem

function Sonnensystem.new ()  
  local instance = setmetatable({}, Sonnensystem)
  instance.sonne = Himmelskoerper.new("Sonne",      2.0*10^30,  1391000/2,  {0*10^6, 0, 0},      geschwindigkeit, color.sunny_yellow)
  instance.merkur = Himmelskoerper.new("Merkur",    3.3*10^23,  4878/2,     {58*10^6, 0, 0},     geschwindigkeit)
  instance.venus = Himmelskoerper.new("Venus",      4.9*10^24,  12103/2,    {108*10^6, 0, 0},    geschwindigkeit)
  instance.erde = Himmelskoerper.new("Erde",        6.0*10^24,  12756.28/2, {150*10^6, 0, 0},    geschwindigkeit, color.cloudy_blue)
  instance.mond = Himmelskoerper.new("Mond",        7.35*10^22, 3473.8/2,   {149.52660^6, 0, 0}, geschwindigkeit, color.pale)
  instance.mars = Himmelskoerper.new("Mars",        6.4*10^23,  6794/2,     {228*10^6, 0, 0},    geschwindigkeit, color.orangered)
  instance.jupiter = Himmelskoerper.new("Jupiter",  1.9*10^27,  142984/2,   {778*10^6, 0, 0},    geschwindigkeit)
  instance.saturn = Himmelskoerper.new("Saturn",    5.7*10^26,  120536,     {1427*10^6, 0, 0},   geschwindigkeit)
  instance.uranus = Himmelskoerper.new("Uranus",    8.7*10^25,  51118/2,    {2871*10^6, 0, 0},   geschwindigkeit)
  instance.neptun = Himmelskoerper.new("Neptun",    1.02*10^26, 49532/2,    {4498*10^6, 0, 0},   geschwindigkeit)
  instance.pluto = Himmelskoerper.new("Pluto",      1.3*10^22,  5906,       {5906*10^6, 0, 0},   geschwindigkeit)
  
  -- instance.planetX = Himmelskoerper.new("PlanetX", 1.0*10^25, 10000, {0*10^6, 0, 0}, geschwindigkeit)
    return instance
end

function Sonnensystem:print()
  print("**** Sonnensystem ****")
  PrintTable(self, 3, 0)
end
