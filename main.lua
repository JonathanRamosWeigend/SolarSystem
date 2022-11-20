-- --------------------------------------------------------------------------------------------------------
-- Solar Simulation with LUA and LOVE2D
-- (c) Jonathan Ramos Weigend, Johannes Weigend
-- November 2022, Blumenau Brasilien
-- --------------------------------------------------------------------------------------------------------
require "sonnensystem" 
require "himmelskoerper" 

local screenSize = {} -- will be set at load
local sonnensystem = Sonnensystem.new()

function love.conf(t)
	t.console = true
end

function love.load()
    love.window.setFullscreen(true);
    width, height = love.window.getDesktopDimensions()
    screenSize = {width, height}
end

local counter = 0
function printCounter() 
    width, height = love.window.getDesktopDimensions(1)
    love.graphics.setColor(love.math.colorFromBytes(200, 200, 200))
    love.graphics.print(counter, screenSize[1] - 100,  screenSize[2] - 20)
    counter = counter + 1
end

function love.draw()
    drawSonnensystem()
    printCounter()
    sonnensystem:tick()
end

function drawSonnensystem()
    for name, himmelskoerper in pairs(sonnensystem) do
        xPos = universeToScreenX(himmelskoerper.position[1])
        yPos = universeToScreenY(himmelskoerper.position[2])
        radius = extendToScreen(himmelskoerper.radius)
        rgb = himmelskoerper.farbe
        love.graphics.setColor(love.math.colorFromBytes(rgb[1], rgb[2], rgb[3]))
        love.graphics.circle( "fill", xPos, yPos, radius )   
    end
end

function universeToScreenX(position)
    percentage = position / sonnensystem.getTotalSize()
    return percentage * screenSize[1] + screenSize[1] / 2.0
end

function universeToScreenY(position)
    percentage = position / sonnensystem.getTotalSize()
    return -1 * percentage * screenSize[2] + screenSize[2] / 2.0
end

function extendToScreen(size)
    percentage = size / sonnensystem.getTotalSize() * 10 -- 10x bigger
    return (percentage * screenSize[1]) + 1
end
