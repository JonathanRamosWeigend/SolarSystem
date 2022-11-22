-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- (c) Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------

require "himmelskoerper" 
require "utils" 
require "colors"

-- Class Sonnensystem
Sonnensystem = {}
Sonnensystem.__index = Sonnensystem


-- Units are kg, km, km/h 
function Sonnensystem.new ()  
  local instance = setmetatable({}, Sonnensystem)
  --                                    Name,     Masse:kg,   Radius:km,    Position:km,        v:km/h,         Farbe 
  instance.sonne  = Himmelskoerper.new("Sonne",   1.0*10^30,  1391000/2,  {0*10^6,    0, 0},  {0,0,0},        color.sunny_yellow)
  instance.merkur = Himmelskoerper.new("Merkur",  3.3*10^23,  4878/2,     {58*10^6,   0, 0},  {0,172332,0},   color.cool_grey)
  instance.venus  = Himmelskoerper.new("Venus",   4.9*10^24,  12103/2,    {108*10^6,  0, 0},  {0,126072,0},   color.orangered)
  instance.erde   = Himmelskoerper.new("Erde",    6.0*10^24,  12756.28/2, {149*10^6,  0, 0},  {0, 107208,0},  color.cloudy_blue)
  instance.mars   = Himmelskoerper.new("Mars",    6.4*10^23,  6794/2,     {228*10^6,  0, 0},  {0,86868,0},    color.darkish_red)
  instance.jupiter= Himmelskoerper.new("Jupiter", 1.9*10^27,  142984/2,   {778*10^6,  0, 0},  {0,47052,0},    color.dark_beige)
  instance.saturn = Himmelskoerper.new("Saturn",  5.7*10^26,  120536,     {1427*10^6, 0, 0},  {0,34884,0},    color.pale)
  instance.uranus = Himmelskoerper.new("Uranus",  8.7*10^25,  51118/2,    {2871*10^6, 0, 0},  {0,24516,0},    color.light_light_blue)
  instance.neptun = Himmelskoerper.new("Neptun",  1.02*10^26, 49532/2,    {4498*10^6, 0, 0},  {0,19548,0},    color.strong_blue)
  instance.pluto  = Himmelskoerper.new("Pluto",   1.3*10^22,  5906/2,     {5906*10^6, 0, 0},  {0,16812,0},    color.off_white)
  
  -- instance.planetX = Himmelskoerper.new("PlanetX", 1.0*10^25, 10000, {0*10^6, 0, 0}, geschwindigkeit)
  -- instance.mond = Himmelskoerper.new("Mond",        7.35*10^22, 3473.8/2,   {150^6, 0, 0}, {0,0,0}, color.pale)
  return instance
end

function Sonnensystem:getTotalSize() 
  return 6.0*10^9
end

function Sonnensystem:print()
  print("**** Sonnensystem ****")
  PrintTable(self, 3, 0)
end

local G = 6.67430 * 10^-11

-- tick = 1h
function Sonnensystem:tick()
  for n1, h1 in pairs(self) do
    for n2, h2 in pairs(self) do
      if n1 == n2 then goto continue end
      
      -- Berechne Abstand r absolute (h1 <-> h2) in km
      r = math.sqrt(
          (h1.position[1] - h2.position[1])^2 +
          (h1.position[2] - h2.position[2])^2 +
          (h1.position[3] - h2.position[3])^2
      ) 
      -- Kollisionsprüfung
      if r < (h1.radius * 2 + h2.radius * 2) then
        -- todo colision
        goto continue
      end      
      
      -- Berechne Kraft nach Newton F1,F2 - Radius in km
      F = G * h1.masse * h2.masse / (r*1000)^2

      -- Berechne neue Geschwindigkeit
      a1 = F / h1.masse -- m/s^2
      a2 = F / h2.masse -- m/s^2

      dv1 = a1  * 1000 * 24  -- Delta Geschwindigkeit 1h in km
      dv2 = a2  * 1000 * 24-- Delta Geschwindigkeit 1h in km

      -- Richtungsvektoren - Einheitsvektoren
      v0r1 = {1/r*(h2.position[1] - h1.position[1]),
             1/r*(h2.position[2] - h1.position[2]),
             1/r*(h2.position[3] - h1.position[3])}
      v0r2 = {1/r*(h1.position[1] - h2.position[1]),
             1/r*(h1.position[2] - h2.position[2]),
             1/r*(h1.position[3] - h2.position[3])}
      
     -- Neu Geschwindigkeit ist alte Geschwindigkeit + Delta * Komponente
      h1.geschwindigkeit = {h1.geschwindigkeit[1] + v0r1[1] * dv1,
                            h1.geschwindigkeit[2] + v0r1[2] * dv1,
                            h1.geschwindigkeit[3] + v0r1[3] * dv1}
      h2.geschwindigkeit = {h2.geschwindigkeit[1] + v0r2[1] * dv2,
                            h2.geschwindigkeit[2] + v0r2[2] * dv2,
                            h2.geschwindigkeit[3] + v0r2[3] * dv2}

    end
    ::continue::
  end

  for n, h in pairs(self) do
    sx = h.geschwindigkeit[1]  -- == km/h * 1h
    sy = h.geschwindigkeit[2] 
    sz = h.geschwindigkeit[3] 
    
    posx = h.position[1]
    posy = h.position[2]
    posz = h.position[3]

    h.position = {posx + sx, posy + sy, posz + sz}
  end
end